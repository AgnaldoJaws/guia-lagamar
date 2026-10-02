#!/usr/bin/env bash
# Deploy an immutable GHCR image to the production stack.
# Usage: ./deploy/deploy.sh <commit-sha-or-full-image-reference>
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose.prod.yml"
ENV_FILE="$PROJECT_ROOT/.env"
IMAGE_INPUT="${1:?Usage: deploy.sh <commit-sha-or-full-image-reference>}"
IMAGE_REPOSITORY="${IMAGE_REPOSITORY:-ghcr.io/${GITHUB_REPOSITORY:-}/guia-lagamar}"

if [[ "$IMAGE_INPUT" == ghcr.io/* || "$IMAGE_INPUT" == */*:* ]]; then
    IMAGE="$IMAGE_INPUT"
else
    [[ -n "$IMAGE_REPOSITORY" && "$IMAGE_REPOSITORY" != "ghcr.io//guia-lagamar" ]] || {
        echo "IMAGE_REPOSITORY must be set when a SHA (rather than a full image) is supplied." >&2
        exit 2
    }
    IMAGE="${IMAGE_REPOSITORY}:${IMAGE_INPUT}"
fi

[[ -f "$ENV_FILE" ]] || { echo "Missing production environment file: $ENV_FILE" >&2; exit 2; }

compose() {
    # APP_IMAGE exists only for this command. Secrets remain in .env and no
    # mutable image state is written to the host.
    APP_IMAGE="$IMAGE" docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" "$@"
}

echo "Pulling ${IMAGE}..."
compose pull app nginx caddy mysql

echo "Ensuring persistent services are available..."
compose up -d mysql app

echo "Waiting for PHP-FPM app health..."
for i in $(seq 1 60); do
    status="$(docker inspect --format '{{.State.Health.Status}}' guia-lagamar-app 2>/dev/null || true)"
    [[ "$status" == "healthy" ]] && break
    [[ "$status" == "unhealthy" ]] && {
        compose logs --tail=100 app >&2
        exit 1
    }
    sleep 2
done
[[ "$(docker inspect --format '{{.State.Health.Status}}' guia-lagamar-app)" == "healthy" ]] || {
    compose logs --tail=100 app >&2
    exit 1
}

echo "Running migrations..."
compose exec -T app php artisan migrate --force

echo "Refreshing Laravel production caches..."
compose exec -T app php artisan optimize:clear
compose exec -T app php artisan storage:link
compose exec -T app php artisan config:cache
compose exec -T app php artisan route:cache
compose exec -T app php artisan view:cache

echo "Updating Nginx and Caddy..."
compose up -d --force-recreate nginx caddy

echo "Validating internal health through Nginx..."
for i in $(seq 1 60); do
    if compose exec -T nginx wget -q -O /dev/null http://127.0.0.1/up; then
        break
    fi
    sleep 2
done
compose exec -T nginx wget -q -O /dev/null http://127.0.0.1/up

echo "Validating external HTTPS health..."
curl --fail --silent --show-error --location --max-time 20 https://passaronegro.com.br/up >/dev/null

echo "Validating admin login over HTTPS..."
admin_headers="$(mktemp)"
admin_html="$(mktemp)"
trap 'rm -f "$admin_headers" "$admin_html"' EXIT
curl --fail --silent --show-error --location --max-time 20 \
    --dump-header "$admin_headers" \
    --output "$admin_html" \
    https://passaronegro.com.br/admin/login

if grep -Fq 'http://passaronegro.com.br' "$admin_html" "$admin_headers"; then
    echo "Found insecure passaronegro.com.br URL in /admin/login response." >&2
    exit 1
fi

grep -Eiq '^HTTP/[0-9.]+ 200' "$admin_headers" || {
    echo "/admin/login did not return HTTP 200." >&2
    cat "$admin_headers" >&2
    exit 1
}

if grep -Eiq '^location: http://passaronegro\.com\.br' "$admin_headers"; then
    echo "Found insecure redirect in /admin/login response." >&2
    cat "$admin_headers" >&2
    exit 1
fi

for asset in \
    /css/filament/forms/forms.css \
    /css/filament/filament/app.css \
    /js/filament/filament/app.js
do
    curl --fail --silent --show-error --max-time 20 "https://passaronegro.com.br${asset}" >/dev/null
done

echo "Current production containers:"
compose ps

echo "Deploy complete: ${IMAGE}"

#!/usr/bin/env bash
# Deploy an immutable GHCR image to the inactive Blue/Green slot.
# Usage: ./deploy/deploy.sh <commit-sha-or-full-image-reference>
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose.prod.yml"
RUNTIME_DIR="$SCRIPT_DIR/runtime"
IMAGES_FILE="$RUNTIME_DIR/images.env"
ACTIVE_FILE="$RUNTIME_DIR/active-slot"
CADDY_ACTIVE_FILE="$RUNTIME_DIR/active.caddy"
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
mkdir -p "$RUNTIME_DIR"
touch "$IMAGES_FILE"

compose() {
    # The production .env supplies Laravel and MySQL credentials. images.env
    # contains only non-secret immutable image references and overrides no DB
    # values.
    docker compose --env-file "$ENV_FILE" --env-file "$IMAGES_FILE" -f "$COMPOSE_FILE" "$@"
}

wait_for_mysql() {
    local health=""
    echo "Waiting for MySQL healthcheck..."
    for _ in $(seq 1 36); do
        health="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}starting{{end}}' guia-lagamar-mysql 2>/dev/null || true)"
        [[ "$health" == "healthy" ]] && return 0
        [[ "$health" == "unhealthy" ]] && { docker logs --tail 100 guia-lagamar-mysql >&2 || true; return 1; }
        sleep 5
    done
    docker logs --tail 100 guia-lagamar-mysql >&2 || true
    return 1
}

active_slot=""
if [[ -f "$ACTIVE_FILE" ]]; then
    active_slot="$(tr -d '[:space:]' < "$ACTIVE_FILE")"
fi
if [[ "$active_slot" != "blue" && "$active_slot" != "green" ]]; then
    active_slot=""
fi

if [[ "$active_slot" == "blue" ]]; then
    target_slot="green"
else
    target_slot="blue"
fi
target_service="app-${target_slot}"
target_container="guia-lagamar-app-${target_slot}"
old_container=""
[[ -n "$active_slot" ]] && old_container="guia-lagamar-app-${active_slot}"

write_caddy_config() {
    local live_slot="$1"
    local probe_slot="$2"
    if [[ -z "$live_slot" ]]; then
        cat > "$CADDY_ACTIVE_FILE" <<'EOF'
:80 {
    respond "Application is being deployed" 503
}
EOF
        return
    fi

    cat > "$CADDY_ACTIVE_FILE" <<EOF
{\$APP_DOMAIN:localhost} {
    encode zstd gzip
    @deploymentProbe path /__deployment-health
    handle @deploymentProbe {
        uri replace /__deployment-health /up
        reverse_proxy app-${probe_slot}:80
    }
    handle {
        reverse_proxy app-${live_slot}:80
    }
}
EOF
}

reload_caddy() {
    docker exec guia-lagamar-caddy caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile
}

check_via_caddy() {
    local domain path
    path="${1:-/up}"
    domain="$(docker exec guia-lagamar-caddy /bin/sh -c 'printf %s "$APP_DOMAIN"')"
    [[ -n "$domain" ]] || domain="localhost"
    docker exec guia-lagamar-caddy wget -q -O /dev/null --no-check-certificate --header="Host: ${domain}" "https://127.0.0.1${path}"
}

cleanup_failed_target() {
    local status=$?
    if [[ $status -ne 0 ]]; then
        echo "Deploy failed; keeping ${active_slot:-no existing slot} serving traffic." >&2
        if [[ -n "$active_slot" ]]; then
            compose rm -sf "$target_service" >/dev/null 2>&1 || true
            write_caddy_config "$active_slot" "$active_slot"
            reload_caddy >/dev/null 2>&1 || true
        else
            write_caddy_config "" ""
            reload_caddy >/dev/null 2>&1 || true
            compose rm -sf "$target_service" >/dev/null 2>&1 || true
        fi
    fi
    exit "$status"
}
trap cleanup_failed_target EXIT

# Start Caddy once. The initial file deliberately serves 503 until the first
# application is healthy, which lets the proxy stay up through all later deploys.
if [[ ! -f "$CADDY_ACTIVE_FILE" ]]; then
    write_caddy_config "" ""
fi
compose up -d caddy
compose up -d mysql
wait_for_mysql

printf 'Deploying %s to %s (current: %s)\n' "$IMAGE" "$target_slot" "${active_slot:-none}"
if [[ "$target_slot" == "blue" ]]; then
    grep '^APP_GREEN_IMAGE=' "$IMAGES_FILE" > "$IMAGES_FILE.next" 2>/dev/null || true
    printf 'APP_BLUE_IMAGE=%s\n' "$IMAGE" >> "$IMAGES_FILE.next"
    mv "$IMAGES_FILE.next" "$IMAGES_FILE"
else
    grep '^APP_BLUE_IMAGE=' "$IMAGES_FILE" > "$IMAGES_FILE.next" 2>/dev/null || true
    printf 'APP_GREEN_IMAGE=%s\n' "$IMAGE" >> "$IMAGES_FILE.next"
    mv "$IMAGES_FILE.next" "$IMAGES_FILE"
fi

compose pull "$target_service"
compose up -d --no-deps --force-recreate "$target_service"

echo "Waiting for native container healthcheck..."
for _ in $(seq 1 36); do
    health="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}starting{{end}}' "$target_container" 2>/dev/null || true)"
    [[ "$health" == "healthy" ]] && break
    [[ "$health" == "unhealthy" ]] && { docker logs --tail 100 "$target_container" >&2 || true; exit 1; }
    sleep 5
done
[[ "${health:-}" == "healthy" ]] || { docker logs --tail 100 "$target_container" >&2 || true; exit 1; }

echo "Running storage link, migrations, and Laravel production caches..."
docker exec "$target_container" php artisan package:discover --ansi
docker exec "$target_container" php artisan storage:link --relative
docker exec "$target_container" php artisan migrate --force
docker exec "$target_container" php artisan optimize
docker exec "$target_container" curl --fail --silent --show-error http://127.0.0.1/up >/dev/null

# Keep normal traffic on the old slot, but prove the candidate through Caddy.
write_caddy_config "${active_slot:-$target_slot}" "$target_slot"
reload_caddy
check_via_caddy /__deployment-health

echo "Switching Caddy upstream to ${target_slot}..."
write_caddy_config "$target_slot" "$target_slot"
reload_caddy
check_via_caddy
printf '%s\n' "$target_slot" > "$ACTIVE_FILE"

if [[ -n "$old_container" ]]; then
    echo "Stopping previous slot: ${active_slot}"
    compose stop "app-${active_slot}"
fi

trap - EXIT
echo "Deploy complete: ${target_slot} is serving ${IMAGE}"

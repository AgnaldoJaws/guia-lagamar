#!/usr/bin/env bash
# Deploy an immutable GHCR image to the production app service.
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
    # mutable image/slot state is written to the host.
    APP_IMAGE="$IMAGE" docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" "$@"
}

echo "Pulling ${IMAGE}..."
compose pull app

echo "Running migrations..."
compose run --rm --no-deps app php artisan migrate --force

echo "Updating app container..."
compose up -d app

echo "Deploy complete: ${IMAGE}"

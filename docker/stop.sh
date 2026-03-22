#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/_context.sh"
use_docker_desktop_context

echo "Stopping Ollama stack..."
docker compose -f "$COMPOSE_FILE" down

echo "Done."

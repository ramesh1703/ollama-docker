#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/_context.sh"
use_docker_desktop_context

echo "=== Docker Context ==="
docker context show 2>&1 || true
echo ""
echo "=== Ollama stack ==="
docker compose -f "$COMPOSE_FILE" ps 2>&1 || true

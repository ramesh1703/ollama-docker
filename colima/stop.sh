#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"

echo "Stopping Ollama stack..."
docker compose -f "$COMPOSE_FILE" down

echo "Stopping Colima..."
colima stop

echo "Done."

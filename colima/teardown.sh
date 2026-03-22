#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"

echo "Tearing down Ollama stack (containers and named volumes)..."
docker compose -f "$COMPOSE_FILE" down -v

echo "Stopping Colima..."
colima stop

echo "Done. Model and Open WebUI data volumes were removed."

#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Stopping Ollama stack..."
docker compose -f "$SCRIPT_DIR/docker-compose.yml" down

echo "Stopping Colima..."
colima stop

echo "Done."

#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/docker-compose.yml"
CPUS=4
MEMORY=8

echo "Starting Colima (${CPUS} CPUs, ${MEMORY}GB RAM)..."
if colima status 2>/dev/null | grep -q "Running"; then
  echo "Colima is already running."
else
  colima start --cpu "$CPUS" --memory "$MEMORY"
fi

echo "Switching Docker context to colima..."
docker context use colima

echo "Building and starting Ollama stack..."
docker compose -f "$COMPOSE_FILE" up -d --build

echo ""
echo "Ollama is available at http://localhost:11434"

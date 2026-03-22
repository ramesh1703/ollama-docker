#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Colima ==="
colima status 2>&1 || true
echo ""
echo "=== Docker Context ==="
docker context show 2>&1 || true
echo ""
echo "=== Ollama Container ==="
docker compose -f "$SCRIPT_DIR/docker-compose.yml" ps 2>&1 || true

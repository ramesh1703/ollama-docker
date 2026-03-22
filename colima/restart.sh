#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Restarting..."
"$SCRIPT_DIR/stop.sh"
"$SCRIPT_DIR/start.sh"

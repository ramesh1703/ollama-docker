#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Restarting..."
"$SCRIPT_DIR/colima-stop.sh"
"$SCRIPT_DIR/colima-start.sh"

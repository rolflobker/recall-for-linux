#!/usr/bin/env bash
# Get the directory this script is in
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
MIME_FILE="$PROJECT_DIR/mime.types"

SHARE_DIR="$HOME/.recall/shared"
mkdir -p "$SHARE_DIR"

PORT=8080

echo "Hosting fun Collaberation Feature on http://$(hostname -s):$PORT/"

# Start BusyBox HTTP server
busybox httpd -f -p "$PORT" -h "$SHARE_DIR"

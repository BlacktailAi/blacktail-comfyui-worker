#!/usr/bin/env bash

set -e

SNAPSHOT_FILE=$(ls /*snapshot*.json 2>/dev/null | head -n 1)

if [ -z "$SNAPSHOT_FILE" ]; then
    echo "blacktail-comfyui-worker: No snapshot file found. Exiting..."
    exit 0
fi

echo "blacktail-comfyui-worker: restoring snapshot: $SNAPSHOT_FILE"

comfy --workspace /comfyui node restore-snapshot "$SNAPSHOT_FILE" --pip-non-url

echo "blacktail-comfyui-worker: restored snapshot file: $SNAPSHOT_FILE"
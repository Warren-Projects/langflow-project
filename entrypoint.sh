#!/bin/sh

VENV_PIP="/app/.venv/bin/pip"

# Wait until the venv is available
i=0
while [ ! -x "$VENV_PIP" ] && [ $i -lt 10 ]; do
  echo "[INFO] Waiting for /app/.venv/bin/pip to become available..."
  sleep 2
  i=$((i+1))
done

if [ ! -x "$VENV_PIP" ]; then
  echo "[ERROR] Could not find /app/.venv/bin/pip after waiting."
  exit 1
fi

# Install cloudinary specifically into the internal venv
echo "[INFO] Installing cloudinary==1.43.0 into /app/.venv..."
$VENV_PIP install cloudinary==1.43.0

echo "[INFO] Starting Langflow..."
exec langflow run --host 0.0.0.0 --port 7860

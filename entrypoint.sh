#!/bin/sh

# Set default venv path
VENV_PATH="/app/.venv"

echo "[INFO] Checking Langflow virtual environment..."

# If venv doesn't exist, create it
if [ ! -d "$VENV_PATH" ]; then
    echo "[WARNING] Venv not found. Creating a new virtual environment at $VENV_PATH..."
    python3 -m venv $VENV_PATH
fi

# Upgrade pip in the venv
$VENV_PATH/bin/pip install --upgrade pip

# Install cloudinary in the venv
echo "[INFO] Installing cloudinary in Langflow venv..."
$VENV_PATH/bin/pip install cloudinary==1.43.0

# Start Langflow using the system-level command (Langflow image already handles .venv activation)
echo "[INFO] Starting Langflow..."
exec langflow run --host 0.0.0.0 --port 7860

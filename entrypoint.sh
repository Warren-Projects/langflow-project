#!/bin/sh

# Wait until the venv is created, then install cloudinary into it
if [ -f "/app/.venv/bin/pip" ]; then
    echo "Installing cloudinary into Langflow venv..."
    /app/.venv/bin/pip install cloudinary==1.43.0
else
    echo "WARNING: /app/.venv/bin/pip not found. Trying system pip..."
    pip install cloudinary==1.43.0
fi

# Start Langflow normally
exec langflow run --host 0.0.0.0 --port 7860

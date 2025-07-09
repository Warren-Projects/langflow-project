FROM langflowai/langflow:latest

# 1. First handle system dependencies as root
USER root

# Only run apt if you ACTUALLY need system packages
# Example: if Cloudinary needs libssl or other system libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \  # Often needed for Python packages with C extensions
    && rm -rf /var/lib/apt/lists/*

# 2. Install Python packages
RUN pip install --no-cache-dir cloudinary

# 3. Switch to non-root user (langflow image uses UID 1000)
USER 1000

# 4. Your custom file operations
WORKDIR /app
COPY --chown=1000:1000 src/backend/base/langflow/components/vectorstores/astradb_graph.py /tmp/astradb_graph.py

# 5. Find site-packages and copy files
RUN python -c "import site; print(site.getsitepackages()[0])" > /tmp/site_packages.txt && \
    SITE_PACKAGES=$(cat /tmp/site_packages.txt) && \
    mkdir -p "$SITE_PACKAGES/langflow/components/vectorstores" && \
    cp /tmp/astradb_graph.py "$SITE_PACKAGES/langflow/components/vectorstores/" && \
    find "$SITE_PACKAGES" -name "*.pyc" -delete && \
    find "$SITE_PACKAGES" -name "__pycache__" -type d -exec rm -rf {} +

# 6. Runtime config
EXPOSE 7860
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
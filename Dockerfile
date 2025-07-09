FROM langflowai/langflow:latest

# 1. First install system dependencies as root
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    any-system-dependencies-here && \
    rm -rf /var/lib/apt/lists/*

# 2. Install Python packages as root (system-wide)
RUN pip install --no-cache-dir cloudinary

# 3. Switch to non-root user for runtime
USER langflow

# 4. Copy application files
WORKDIR /app
COPY --chown=langflow:langflow 

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]


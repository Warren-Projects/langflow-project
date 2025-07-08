FROM langflowai/langflow:latest

# Copy entrypoint script to a safe path (app-owned folder)
COPY entrypoint.sh /app/entrypoint.sh

# No need for chmod if script is pre-chmodded locally
ENTRYPOINT ["/app/entrypoint.sh"]

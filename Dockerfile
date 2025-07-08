FROM langflowai/langflow:latest

# Use ENTRYPOINT script to install cloudinary once venv exists
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

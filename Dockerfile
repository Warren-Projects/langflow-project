FROM langflowai/langflow:latest

# Copy script into writable path
COPY entrypoint.sh /app/entrypoint.sh

# Use sh to bypass executable permission issue
ENTRYPOINT ["sh", "/app/entrypoint.sh"]

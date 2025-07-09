FROM langflowai/langflow:latest

# Set working directory
WORKDIR /app

# Install Cloudinary (must happen before file copying for optimal layer caching)
RUN pip install --no-cache-dir cloudinary

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]


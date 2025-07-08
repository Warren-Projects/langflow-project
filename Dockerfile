FROM langflowai/langflow:latest

# Install the cloudinary Python package
RUN /app/.venv/bin/pip install cloudinary==1.43.0

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]


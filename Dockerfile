FROM langflowai/langflow:latest

# Use system pip to install cloudinary globally
RUN pip install cloudinary==1.43.0

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]


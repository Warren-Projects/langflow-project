FROM langflowai/langflow:latest

RUN pip install cloudinary

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]


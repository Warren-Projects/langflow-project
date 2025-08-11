FROM langflowai/langflow:latest

# Install pip in the virtual environment
RUN /app/.venv/bin/python -m ensurepip --upgrade

# Install the cloudinary module using the pip from the virtual environment
RUN /app/.venv/bin/python -m pip install cloudinary
RUN /app/.venv/bin/python -m pip install PyPDF2
RUN /app/.venv/bin/python -m pip install pytesseract

# Set the environment variable to use the virtual environment’s Python by default
ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 7860

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]

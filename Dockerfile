# Use Python 3.10 slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY travel_agent.py .
COPY templates/ templates/

# Set environment variables (override at runtime)
ENV AZURE_INFERENCE_ENDPOINT="" \
    AZURE_INFERENCE_MODEL="gpt-4o"

# Expose port 5000
EXPOSE 5000

# Run the web application
CMD ["python", "travel_agent.py"]

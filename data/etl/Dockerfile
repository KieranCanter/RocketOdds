# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . ./

# Set entrypoint
ENTRYPOINT ["python3", "etl/main.py"]
CMD ["days_back=1", "--postgres", "--s3"]
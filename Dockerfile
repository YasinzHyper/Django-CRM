# Use Python 3.11 as base image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        default-libmysqlclient-dev \
        pkg-config \
        netcat-openbsd \
        dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app/

# Expose port
EXPOSE 8000

# Create entrypoint script
COPY entrypoint.sh /app/
COPY troubleshoot.sh /app/
# Convert line endings to Unix format and make executable
RUN dos2unix /app/entrypoint.sh /app/troubleshoot.sh 2>/dev/null || sed -i 's/\r$//' /app/entrypoint.sh /app/troubleshoot.sh \
    && chmod +x /app/entrypoint.sh /app/troubleshoot.sh

# Run entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

FROM python:3.9-slim

# Metadata labels
LABEL org.opencontainers.image.source="https://github.com/westsurname/scripts"
LABEL org.opencontainers.image.description="Docker image for the scripts service"

ARG SERVICE_NAME=scripts

# Set working directory
WORKDIR /app

# Copy only the files needed for pip install to maximize cache utilization
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

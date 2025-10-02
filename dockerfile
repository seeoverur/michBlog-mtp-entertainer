# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
EXPOSE 8080
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Run with Gunicorn (production server)
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]

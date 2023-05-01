# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY server_src/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    /usr/local/bin/python -m pip install --upgrade pip

# Copy the current directory contents into the container at /app
COPY server_src/ /app

# Set environment variables
ENV FLASK_APP app.py
ENV FLASK_ENV development
ENV MYSQL_HOST db
ENV MYSQL_USER root
ENV MYSQL_PASSWORD toor
ENV MYSQL_DB items_db

# Expose port 5000 for the Flask app
EXPOSE 5000

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
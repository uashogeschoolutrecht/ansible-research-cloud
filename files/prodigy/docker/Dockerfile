# You may need to specify the --platform depending on cloud provider
FROM --platform=linux/amd64 python:3.9

# Set the working directory in the container
WORKDIR /app

# Install system dependencies: sqlite3 and gzip
RUN apt-get update && \
    apt-get install -y sqlite3 gzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements first
COPY requirements.txt .

# Create a virtual environment and activate it
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Install everything
ARG PRODIGY_KEY
RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt && \
    python -m pip install prodigy -f https://${PRODIGY_KEY}@download.prodi.gy

# Copy the rest of the files
COPY . .

# Expose port 8080 for the Prodigy service inside the container
EXPOSE 8080

# Run the run.sh script
CMD ["bash", "run.sh"]


FROM python:3.9

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy source code
COPY github_utils.py .

# Set command to run the script
CMD ["python", "github_utils.py"]
FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.9.0@sha256:e8d4a3f42941d5e6f85f0e71b6035dddc46ee52e3698e09eb52f4ed439d68d02

# Switch to root user to install dependencies
USER root

# Set working directory
# WORKDIR /app

# Copy the requirements file and source code
COPY requirements.txt requirements.txt
# COPY src/ .

# Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# Ensure Jupyter is installed if running notebooks
# RUN pip install --no-cache-dir jupyter

# Switch back to the original container user
USER ${CONTAINER_UID}

ENTRYPOINT ["python3", "main.py"]

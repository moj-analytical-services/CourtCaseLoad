FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.7.0@sha256:5de4dfa5a59c219789293f843d832b9939fb0beb65ed456c241b21928b6b8f59

# Switch to root user
USER root

# Copy files
COPY requirements.txt .
# COPY src/ .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Switch back to container user
USER ${CONTAINER_UID}

# Set entry point
ENTRYPOINT ["python3", "main.py"]

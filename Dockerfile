FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.7.0@sha256:5de4dfa5a59c219789293f843d832b9939fb0beb65ed456c241b21928b6b8f59

# Switch to root user to install dependencies
USER root

# Set working directory
WORKDIR /app

# Copy the requirements file and source code
COPY requirements.txt requirements.txt
# COPY src/ .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure Jupyter is installed if running notebooks
RUN pip install --no-cache-dir jupyter

# Switch back to the original container user
USER ${CONTAINER_UID}

# Expose Jupyter Notebook port
EXPOSE 8888

# Set entrypoint to start Jupyter Notebook
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

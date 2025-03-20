FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.8.0@sha256:a7d7872482a845e67fc7f78401a6e4a89d906f07d67aca1f7c636cd3c92ae81a

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

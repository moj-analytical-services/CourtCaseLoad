FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.7.0@sha256:5de4dfa5a59c219789293f843d832b9939fb0beb65ed456c241b21928b6b8f59

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]

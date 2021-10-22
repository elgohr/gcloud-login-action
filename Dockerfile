FROM gcr.io/cloud-builders/gcloud-slim
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM gcr.io/cloud-builders/gcloud-slim as runtime
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM runtime as test
RUN add-apt-repository ppa:duggan/bats \
    && apt-get update \
    && apt-get install -y bats
ADD test.bats /test.bats
ADD mock.sh /builder/google-cloud-sdk/bin/gcloud
RUN /test.bats

FROM runtime
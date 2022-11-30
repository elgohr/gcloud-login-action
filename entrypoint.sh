#!/bin/sh
set -e
echo "${INPUT_ACCOUNT_KEY}" | base64 -d > "${HOME}/gcloud.json" 
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json"

echo "username=oauth2accesstoken" >> "$GITHUB_ENV"
TOKEN=$(gcloud auth print-access-token)
echo "::add-mask::${TOKEN}"
echo "password=${TOKEN}" >> "$GITHUB_ENV"
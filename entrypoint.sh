#!/bin/sh
set -e
echo "${INPUT_ACCOUNT_KEY}" | base64 -d > "${HOME}/gcloud.json" 
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json"

echo "::set-output name=username::oauth2accesstoken"
TOKEN=$(gcloud auth print-access-token)
echo "::add-mask::${TOKEN}"
echo "::set-output name=password::${TOKEN}"
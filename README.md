# gcloud-Container-Registry-Login-Action

[![Actions Status](https://github.com/elgohr/gcloud-login-action/workflows/Test/badge.svg)](https://github.com/elgohr/gcloud-login-action/actions)

This Action for Docker logs into [Google Cloud Container Registry](https://cloud.google.com/container-registry/) and gets the timely bound credentials for Docker.

## Usage

## Example pipeline

```yaml
name: Publish Docker
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Login to gcloud registry
      id: gcloud
      uses: elgohr/gcloud-login-action@master
      with:
        account_key: ${{ secrets.GCLOUD_KEY }}
    - name: Publish to Registry
      uses: elgohr/Publish-Docker-Github-Action@master
      with:
        name: myDocker/repository
        username: ${{ steps.gcloud.outputs.username }}
        password: ${{ steps.gcloud.outputs.password }}
        registry: gcr.io, us.gcr.io, eu.gcr.io or asia.gcr.io
```

## Mandatory arguments

`account_key` Base64 encoded service account key exported as JSON  

## Outputs
`username` the username for logging in  
`password` the password for logging in  

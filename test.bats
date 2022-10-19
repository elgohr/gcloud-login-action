#!/usr/bin/env bats

setup(){
    export GITHUB_ENV="/tmp/githubOutput"
}

teardown() {
  rm -f "${GITHUB_ENV}"
}

@test "it returns the username and password" {
    run /entrypoint.sh

    local expected='auth activate-service-account --key-file=/root/gcloud.json
::set-output name=username::oauth2accesstoken
::add-mask::auth print-access-token
::set-output name=password::auth print-access-token'
    echo $output
    [ "$output" = "$expected" ]
    expectGitHubEnvContains "password=auth print-access-token"

}

expectGitHubEnvContains() {
  local expected=$(echo "${1}" | tr -d '\n')
  local got=$(cat "${GITHUB_ENV}" | tr -d '\n')
  echo "Expected: |${expected}|
  Got: |${got}|"
  echo "${got}" | grep "${expected}"
}
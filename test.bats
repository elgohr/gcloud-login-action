#!/usr/bin/env bats

@test "it returns the username and password" {
    run /entrypoint.sh

    local expected='auth activate-service-account --key-file=/root/gcloud.json
::set-output name=username::oauth2accesstoken
::add-mask::auth print-access-token
::set-output name=password::auth print-access-token'
    echo $output
    [ "$output" = "$expected" ]
}
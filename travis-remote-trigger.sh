#!/bin/bash

body='{
"request": {
  "message": "Build triggered by api request",
  "branch":"master"
}}'

curl -v -s -X POST \
   -H "Content-Type: application/json" \
   -H "Accept: application/json" \
   -H "Travis-API-Version: 3" \
   -H "Authorization: token $TRAVIS_ACCESS_TOKEN" \
   -d "$body" \
   https://api.travis-ci.org/repo/umccr%2Fstackstorm-ami/requests

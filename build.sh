#!/bin/sh

set -e
export AWS_CLI_VERSION=$1

docker build --pull --no-cache -t tristanmorgan/awscli:latest -t tristanmorgan/awscli:$AWS_CLI_VERSION .
docker push tristanmorgan/awscli:$AWS_CLI_VERSION
docker push tristanmorgan/awscli:latest

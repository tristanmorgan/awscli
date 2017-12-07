#!/bin/sh

export AWS_CLI_VERSION=$1

docker build --build-arg AWS_CLI_VERSION=$AWS_CLI_VERSION -t tristanmorgan/awscli:latest -t tristanmorgan/awscli:$AWS_CLI_VERSION .

#!/bin/sh

export AWS_CLI_VERSION=$1

docker build --build-arg AWS_CLI_VERSION=$AWS_CLI_VERSION -t awscli:latest -t awscli:$AWS_CLI_VERSION .

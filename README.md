# AWS CLI in a Docker containter

[![Docker Image](https://img.shields.io/badge/docker-tristanmorgan%2Fawscli-blue.svg)](https://hub.docker.com/r/tristanmorgan/awscli/)

Bundles the [AWS CLI](https://github.com/aws/aws-cli) in a Docker containter.

## Usage

To use like it was installed locally, set an alias:

    alias aws='docker run --rm -v ${PWD}:/work -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN tristanmorgan/awscli'

and to have the auto-completion working too:

    complete -C 'docker run --rm --entrypoint /usr/bin/aws_completer -v ${PWD}:/work -e COMP_LINE -e COMP_POINT tristanmorgan/awscli' aws


FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="AWS-CLI in a minimal container"

ARG AWS_CLI_VERSION=1.14.42
RUN apk add --no-cache python3 py-pip groff \
 && python3 -m pip install wheel --upgrade pip \
 && python3 -m pip install awscli==$AWS_CLI_VERSION \
 && rm -rf /root/.cache

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]


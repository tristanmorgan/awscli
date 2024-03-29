FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan.morgan@servian.com>"
LABEL Description="AWS-CLI in a minimal container"

ARG AWS_CLI_VERSION=2.2.1
RUN apk upgrade --no-cache \
 && apk add --no-cache --virtual .build-deps gcc libc-dev libffi-dev libxml2-dev python3-dev libxslt-dev linux-headers build-base openssl-dev git cmake \
 && apk add --no-cache python3 py-pip groff \
 && python3 -m pip install wheel --upgrade pip \
 && python3 -m pip install git+https://github.com/boto/botocore.git@v2#egg=botocore \
 && python3 -m pip install git+https://github.com/aws/aws-cli.git@${AWS_CLI_VERSION}#egg=awscli \
 && apk del --no-cache .build-deps \
 && rm -rf /root/.cache /src

COPY gen-ac-index /usr/bin/gen-ac-index
RUN /usr/bin/gen-ac-index --include-builtin-index \
 && rm -f /usr/bin/gen-ac-index

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]


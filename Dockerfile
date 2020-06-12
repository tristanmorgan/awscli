FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan.morgan@servian.com>"
LABEL Description="AWS-CLI in a minimal container"

RUN apk upgrade --no-cache \
 && apk add --no-cache --virtual .build-deps gcc libc-dev libffi-dev libxml2-dev python3-dev libxslt-dev linux-headers build-base openssl-dev git \
 && apk add --no-cache python3 py-pip groff \
 && python3 -m pip install wheel --upgrade pip \
 && python3 -m pip install git+https://github.com/boto/botocore.git@v2#egg=botocore \
 && python3 -m pip install git+https://github.com/aws/aws-cli.git@v2#egg=awscli \
 && apk del --no-cache .build-deps \
 && rm -rf /root/.cache /src

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]


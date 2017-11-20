FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="AWS-CLI in a minimal container"

RUN apk add --no-cache python3 groff \
 && python3 -m pip install awscli==1.11.189

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]


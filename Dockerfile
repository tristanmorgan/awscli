FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="AWS-CLI in a minimal container"

RUN apk add --no-cache python2 py2-pip groff \
 && pip install awscli==1.11.189 \
 && apk --purge del py2-pip

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]


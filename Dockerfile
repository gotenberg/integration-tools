FROM alpine:3

RUN apk add --no-cache openjdk11-jre poppler-utils

COPY verapdf /lib/verapdf

RUN ln -s /lib/verapdf/verapdf /usr/bin/verapdf

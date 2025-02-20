FROM debian:12-slim

RUN \
    # Install system dependencies required for the next instructions or debugging.
    # Note: tini is a helper for reaping zombie processes.
    apt-get update -qq &&\
    apt-get upgrade -yqq &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends tini default-jre-headless poppler-utils &&\
    # Cleanup.
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY verapdf /lib/verapdf

RUN ln -s /lib/verapdf/verapdf /usr/bin/verapdf

ENTRYPOINT [ "/usr/bin/tini", "--" ]

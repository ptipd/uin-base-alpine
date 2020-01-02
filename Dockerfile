FROM nimmis/alpine:3.10

MAINTAINER luxmile <luxmile@gmail.com>

RUN apk update && apk upgrade && \
    apk add bash && \
    rm -rf /var/cache/apk/*

# Set environment variables.
ENV HOME /root

# Define default command.
CMD ["/my_init"]
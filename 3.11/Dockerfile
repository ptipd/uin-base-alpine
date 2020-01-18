FROM alpine:3.11

ENV HOME /root

RUN apk update && apk upgrade && \
    apk add bash && \
    rm -rf /var/cache/apk/*

CMD ["/bin/bash"]

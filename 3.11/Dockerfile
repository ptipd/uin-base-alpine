FROM alpine:3.11

ENV HOME /root

RUN printf "Build of ptipd/uin-base-alpine:1.1_3.11, date: %s\n" `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILD && \
    apk update && apk upgrade && \
    apk add bash git curl wget && \
    rm -rf /var/cache/apk/*

CMD ["/bin/bash"]

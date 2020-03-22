ARG OWN_BASE
FROM ${OWN_BASE}

ARG APP_BUILD

RUN printf "Build of ${APP_BUILD}, date: %s\n" `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILD && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add bash tzdata busybox-extras \
        file tree diffutils findutils multitail dos2unix html2text csvtool jq bc \
        net-tools iputils netcat-openbsd mtr socat curl wget wput rsync \
        logrotate git sqlite3 openldap-clients mysql-client && \
    echo 'Asia/Jakarta' > /etc/timezone && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    echo "#\n\
alias i='free -h'\nalias df='clear; df -h'\nalias du='du -csh'\n\
alias l='ls -F'\nalias h='ls -lhF'\nalias a='ls -A'\nalias ha='ls -lhFA'\nalias la='ls -FA'\nalias ll='ls -lF'\n\
alias c='cat'\nalias k='head'\nalias r='more'\nalias g='grep'\nalias v='less'\nalias u='view'\n\
alias t='tail'\nalias tt='tail -n 0 -f'\nalias mt='multitail'\n\
alias cp='cp -i'\nalias mv='mv -i'\nalias md='mkdir'\nalias rd='rmdir'\nalias rm='rm -i'\n\
alias n='netstat -tul'\nalias nr='netstat -nr'\nalias nn='netstat -ntul'\n\
alias s='cd ..'\nalias p='cd -'" > /etc/profile.d/alias.sh && \
    sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc && \
    ln -s /etc/profile.d/alias.sh /root/.bash_aliases && \
    rm -rf /usr/share/doc/* /usr/share/man/* && \
    rm -f /var/log/* /var/cache/apk/*

CMD ["/bin/bash"]

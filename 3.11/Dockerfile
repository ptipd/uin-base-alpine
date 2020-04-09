ARG OWN_BASE
FROM ${OWN_BASE}

ARG APP_BUILD

RUN printf "Build of ${APP_BUILD}, date: %s\n" `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILD && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add bash tzdata busybox-extras && \
    apk add bash tzdata busybox-extras \
        file tree diffutils findutils multitail dos2unix html2text csvtool jq bc \
        net-tools iputils netcat-openbsd mtr socat curl wget wput rsync \
        logrotate git sqlite openldap-clients mysql-client && \
    echo 'Asia/Jakarta' > /etc/timezone && \
    rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    echo -e "#\n\
alias i='free -h'\nalias df='clear; df -h'\nalias du='du -csh'\n\
alias l='ls -F'\nalias h='ls -lhF'\nalias a='ls -A'\nalias ha='ls -lhFA'\nalias la='ls -FA'\nalias ll='ls -lF'\n\
alias c='cat'\nalias k='head'\nalias r='more'\nalias g='grep'\nalias v='less'\nalias u='view'\n\
alias t='tail'\nalias tt='tail -n 0 -f'\nalias mt='multitail'\n\
alias cp='cp -i'\nalias mv='mv -i'\nalias md='mkdir'\nalias rd='rmdir'\nalias rm='rm -i'\n\
alias n='netstat -tul'\nalias nr='netstat -nr'\nalias nn='netstat -ntul'\n\
alias s='cd ..'\nalias p='cd -'" > /etc/profile.d/alias.sh && \
    ln -s /etc/profile.d/alias.sh /root/.bash_aliases && \
    echo -e "if [ \"$BASH\" ]; then\n\
  if [ -f ~/.bashrc ]; then\n\
    . ~/.bashrc\n\
  fi\n\
fi" > /root/.profile && \
    echo -e "[ -z \"\$PS1\" ] && return\n\n\
HISTCONTROL=ignoredups:ignorespace\n\n\
shopt -s histappend\n\n\
HISTSIZE=1000\n\
HISTFILESIZE=2000\n\n\
shopt -s checkwinsize\n\n\
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ '\n\n\
if [ -f ~/.bash_aliases ]; then\n\
    . ~/.bash_aliases\n\
fi" > /root/.bashrc && \
    rm -rf /usr/share/doc/* /usr/share/man/* && \
    rm -f /var/log/* /var/cache/apk/*

CMD ["/bin/bash"]

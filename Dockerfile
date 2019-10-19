FROM sickp/alpine-sshd:latest
RUN echo "root:baidu.com" | chpasswd
RUN apk --update --no-cache add bash \
# install rinetd
COPY rinetd_bbr /usr/local/bin
COPY rinetd.conf /etc
RUN set -ex \
    # Install dependencies
    && apk add --no-cache iptables \
    && chmod +x /usr/local/bin/rinetd_bbr

# install supervisor
RUN apk --update add --no-cache supervisor \
    && mkdir -p /etc/supervisord.d
COPY supervisord.conf /etc
COPY process.conf /etc/supervisord.d
COPY readme.txt /root
STOPSIGNAL SIGTERM
EXPOSE 22 8888 6666

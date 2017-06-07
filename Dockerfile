FROM debian:stretch

ADD src /tmp/src

RUN set -ex && chmod +x /tmp/src/init.sh && /tmp/src/init.sh && rm -rf /tmp/src

EXPOSE 22

CMD /usr/sbin/sshd -D

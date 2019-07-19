FROM shadowsocks/shadowsocks-libev

ENV GATEWAY_IP=

USER root

ADD ./setup-iptables.sh /tmp

RUN apk add --update iptables

CMD /bin/sh /tmp/setup-iptables.sh && \
      exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      -t $TIMEOUT \
      -d $DNS_ADDRS \
      -u \
      $ARGS

EXPOSE 8388 8388/udp

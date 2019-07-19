#!/bin/sh
# Default rule
#iptables -P INPUT   DROP
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD ACCEPT

# Allow Input
#iptables -A INPUT -p tcp --dport $SERVER_PORT -j ACCEPT
#iptables -A INPUT -p udp --dport $SERVER_PORT -j ACCEPT
#iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow gateway ip address
#iptables -A OUTPUT -d $GATEWAY_IP -j ACCEPT

# DROP Private subnet
#iptables -A OUTPUT -d 10.0.0.0/8 -j DROP
#iptables -A OUTPUT -d 172.16.0.0/12 -j DROP
#iptables -A OUTPUT -d 192.168.0.0/16 -j DROP

# Fix udp error https://github.com/shadowsocks/shadowsocks-libev/issues/1619
#iptables -A FORWARD -m state --state UNTRACKED -j ACCEPT

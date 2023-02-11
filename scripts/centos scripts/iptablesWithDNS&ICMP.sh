#!/bin/bash

# Create custom chain
iptables -N http_https

# Allow incoming traffic on port 80 (HTTP)
iptables -A http_https -p tcp --dport 80 -j ACCEPT

# Allow incoming traffic on port 443 (HTTPS)
iptables -A http_https -p tcp --dport 443 -j ACCEPT

# Allow incoming DNS traffic on port 53
iptables -A http_https -p udp --dport 53 -j ACCEPT

# Allow incoming ICMP traffic
iptables -A http_https -p icmp -j ACCEPT

# Drop all other incoming traffic
iptables -A http_https -j DROP

# Jump to custom chain for input traffic
iptables -A INPUT -j http_https

#!/bin/bash

# Allow incoming traffic on port 80 (HTTP)
iptables -A INPUT -p tcp --sport 80 -j ACCEPT

# Allow incoming traffic on port 443 (HTTPS)
iptables -A INPUT -p tcp --sport 443 -j ACCEPT

# Allow incoming DNS traffic on port 53
iptables -A INPUT -p udp --sport 53 -j ACCEPT

# Allow incoming ICMP traffic
iptables -A INPUT -p icmp -j ACCEPT

# Drop all other incoming traffic
iptables -A INPUT -j DROP



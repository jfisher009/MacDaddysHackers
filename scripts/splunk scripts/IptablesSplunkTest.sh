#!/bin/bash

# Flush existing iptables rules
iptables -F

# Allow incoming traffic on port 8000 (Splunk web interface)
iptables -A INPUT -p tcp --dport 8000 -j ACCEPT

# Allow incoming traffic on port 8089 (Splunk data input)
iptables -A INPUT -p tcp --dport 8089 -j ACCEPT

# Allow incoming traffic on port 514 (syslog)
iptables -A INPUT -p udp --dport 514 -j ACCEPT

# Allow incoming traffic on port 1514 (syslog-tls)
iptables -A INPUT -p tcp --dport 1514 -j ACCEPT

# Allow incoming traffic from specific IP addresses or subnets
# Internal, e1/2 subnet
iptables -A INPUT -s 172.20.240.0/24 -j ACCEPT
# User, e1/4 subnet 
iptables -A INPUT -s 172.20.242.0/24 -j ACCEPT
# Public, e1/1 subnet 
iptables -A INPUT -s 172.20.241.0/24 -j ACCEPT



# Drop all other incoming traffic
iptables -A INPUT -j DROP

# Save iptables rules
iptables-save > /etc/iptables.rules

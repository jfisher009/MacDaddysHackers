#!/bin/bash

# Flush Existing Rules 
iptables -F
iptables -X

#Allow ntpstat
iptables -A INPUT -p udp -m udp -j ACCEPT

# Allow Incoming Web Trafic (HTTP and HTTPS)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow SSH traffic on port 64435
iptables -A INPUT -p tcp --dport 64435 -j ACCEPT

# Allow Incoming ICMP Traffic 
iptables -A INPUT -p icmp -j ACCEPT

# Allow Incoming DNS Traffic 
iptables -A INPUT -p udp --dport 53 -j ACCEPT

# Drop All Incoming Traffic 
iptables -A INPUT -j DROP

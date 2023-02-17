#!/bin/bash

# Flush existing rules
iptables -F
iptables -X

# Set default policy
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Allow incoming web traffic (HTTP and HTTPS)
iptables -A INPUT -i ens32 -p tcp --sport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i ens32 -p tcp --sport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 443 -m state --state ESTABLISHED -j ACCEPT


# Allow incoming mail traffic (POP3, IMAP, SMTP)
iptables -A INPUT -i ens32 -p tcp --sport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 110 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i ens32 -p tcp --sport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 25 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i ens32 -p tcp --sport 143 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 143 -m state --state ESTABLISHED -j ACCEPT

# Allow SSH traffic on port 64435
iptables -A INPUT -i ens32 -p tcp --sport 64435 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 64435 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming DNS traffic
iptables -A INPUT -i ens32 -p udp --sport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p udp --dport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -i ens32 -p tcp --sport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p tcp --dport 53 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming ICMP traffic
iptables -A INPUT -i ens32 -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens32 -p icmp -m state --state ESTABLISHED -j ACCEPT

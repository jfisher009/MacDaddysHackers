
#!/bin/bash
# Flush all existing rules
iptables -F

# Allow traffic on ports 25, 587, 143, 993, 110 and 995
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 587 -j ACCEPT
iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A INPUT -p tcp --dport 993 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 995 -j ACCEPT

# Allow traffic for responses to established connections
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Reject all other outgoing traffic
iptables -A OUTPUT -j REJECT

# Block all other incoming traffic
iptables -A INPUT -j DROP

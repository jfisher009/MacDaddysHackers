#!/bin/bash
#
iptables-restore < /etc/iptables.rules
#
iptables -L -v -n --line-numbers | more

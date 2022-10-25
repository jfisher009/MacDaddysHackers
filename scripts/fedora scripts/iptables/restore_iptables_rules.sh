#!/bin/bash
#
iptables-restore < /etc/sysconfig/iptables
#
iptables -L -v -n --line-numbers | more

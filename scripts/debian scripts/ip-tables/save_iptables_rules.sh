#!/bin/bash
#
iptables-save > /etc/iptables.rules
ls -l /etc/iptables.rules

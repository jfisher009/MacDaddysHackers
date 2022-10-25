#!/bin/bash
#
iptables-save > /etc/sysconfig/iptables
ls -l /etc/sysconfig/iptables

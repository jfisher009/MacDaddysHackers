#!/bin/bash
#
iptables -F INPUT
iptables -L -v -n --line-numbers | more

#!/bin/bash

# update installer and install iptables
sudo apt-get update
sudo apt-get install iptables

#check status of current ip tables
echo 'The current status of ip tables'
sudo iptables -L -v

#define chain rules
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT  #SSH
sudo iptables -A INPUT -p tcp --dport 25 -j ACCEPT  #SMTP
sudo iptables -A INPUT -p tcp --dport 110 -j ACCEPT #POP3 

#drop all other traffic
sudo iptables -A INPUT -j DROP

#check status of current ip tables
echo 'The current status of ip tables is now'
sudo iptables -L -v

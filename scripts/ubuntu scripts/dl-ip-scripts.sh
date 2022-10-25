#!/bin/bash
mkdir ip_scripts
cd ip_scripts

wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/ubuntu%20scripts/ip-tables/inbound_ports.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/ubuntu%20scripts/ip-tables/master_iptables.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/ubuntu%20scripts/ip-tables/save_iptables_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/ubuntu%20scripts/ip-tables/list_iptables_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/ubuntu%20scripts/ip-tables/restore_iptables_rules.sh

chmod +x inbound_ports.txt
chmod +x master_iptables.sh
chmod +x save_iptables_rules.sh
chmod +x list_iptables_rules.sh
chmod +x restore_iptables_rules.sh


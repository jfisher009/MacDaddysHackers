#!/bin/bash
mkdir ip_scripts
cd ip_scripts

wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/flush_iptables_INPUT_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/README.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/inbound_ports.txt
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/list_iptables_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/master_iptables.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/restore_iptables_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/save_iptables_rules.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/start_iptables_firewall.sh
wget https://raw.githubusercontent.com/bryanlikescode/hotsauce/main/scripts/fedora%20scripts/iptables/stop_iptables_firewall.sh

chmod +x flush_iptables_INPUT_rules.sh
chmod 777 README.txt
chmod +x inbound_ports.txt
chmod +x list_iptables_rules.sh
chmod +x master_iptables.sh
chmod +x restore_iptables_rules.sh
chmod +x save_iptables_rules.sh
chmod +x start_iptables_firewall.sh
chmod +x stop_iptables_firewall.sh

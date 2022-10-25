The scripts here are intended to help navigate IPTables in Debian and Ubuntu Linux distros. It's recommended to run these as root, or sudo and to do it from the console and not SSH. Here's what each one does:

master_iptables.sh - This is the main script here. Before you run this script place the inbound_ports.txt file in the same directory as the script and add 1 port per line that you want allowed inbound. Upone running it will:
        Flush the inbound (INPUT Chain) rules
        Add a deny-all for the bottom of the ruleset
        Add a 'Related and Established' rule at the top for valid connections
        Add rules for the ports you define in the inbound_ports.txt file
        Display the current rules
        Write the configuration to disk at /etc/iptables.rules
Note: If you reboot the system you need to either run this file again, or restore your configuration from the saved configuration. There's an additional script to help with that if needed (restore_iptables_rules.sh).

flush_iptables.sh - This small script will flush the inbound (INPUT Chain) rules.

list_iptables_rules.sh - This small script will display the current rules.

save_iptables_rules.sh - This small script will save your current rule configuration to /etc/iptables.rules

restore_iptables_rules.sh - This small script will restore your current rule confiugration from /etc/iptables.rules
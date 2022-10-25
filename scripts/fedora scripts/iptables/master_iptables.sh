#/bin/bash
#
#Script Name: iptables.sh
#
#Author: Andy Hoggatt
#Date: 11.15.21
#
#Description: This script reads input from .txt files and configures IPTables based off that input.
#
#Run Information: This script should be run as run or 'sudo' to ensure it has the juice to run the commands. It should also be ran from the console and not SSH.
# The .txt files taken as input should have one entry (like one port number) per line. The script will read in each line and execute commands for each line.
#
##### Delivers a warning to the user #####
clear
echo "Make sure you're running me as Root."
echo ""
echo "It's also best to run this when youre 'consoled', and not SSH'ed, just in case you lose your connection"
echo ""
echo "Are you Root and consoled?"
echo ""
read -p "Press any key to resume if you're ready. Otherwise, close the script"
clear
#########################################
#
##### Preparation #######################
echo "Starting the firewall daemon"
service firewalld start #Starts the firewall daemon (iptables)
sleep 2
echo "Flushing the IPTables INPUT Chain"
iptables -F INPUT #Clears the IPTables INPUT Chain
sleep 2
echo "Adding the deny-all rule"
iptables -I INPUT 1 -j DROP #This adds a deny rule to deny any network traffic not explicitly allowed
iptables -I INPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
sleep 2
#########################################
##### Performs operations on the OUTPUT chain. Not Recommended. Use at own risk.
#echo "Flushing the IPTables OUTPUT Chain"
#iptables -F OUTPUT #Clears the IPTables OUTPUT Chain
#sleep 2
#iptables -I OUTPUT 1 -j DROP
#########################################
#
##### Add the Inbound Ports #############
echo "Now adding the inbound ports"
inboundlist=$(<inbound_ports.txt)
echo "$inboundlist" #Shows the user the ports being added
while IFS= read -r inboundport; do #Reads the file and loops on each line
    iptables -I INPUT 2 -p tcp --dport $inboundport -j ACCEPT #Add an IPTables rule to allow inbound connections on the ports in the inbound_ports.txt file
done < inbound_ports.txt #This is the filename to read
sleep 2
clear
#########################################
##### Performs operations on the OUTPUT chain. Not Recommended. Use at own risk.
#echo "Now adding the outbound ports you specified"
#outboundlist=$(<outbound_ports.txt)
#echo "$outboundlist"
#while IFS= read -r outboundport; do #Reads the file and loops on each line
#    iptables -I OUTPUT 1 -p tcp --dport $outboundport -j ACCEPT #Add an IPTables rule to allow outbound connections on the ports in the outbound_ports.txt file
#done < outbound_ports.txt #This is the filename to read
#sleep 2
#########################################
#
##### Display current rules #############
echo "Here are the IPTables rules now"
sleep 2
echo ""
echo ""
iptables -L -v -n --line-numbers
echo ""
echo ""
read -p "Press any key to resume"
#########################################
#
##### Save rules to disk ################
echo ""
echo "Now saving your rules to disk"
sleep 2
echo ""
iptables-save > /etc/sysconfig/iptables
sleep 2
echo  ""
echo "Your saved rules file can be found at /etc/sysconfig/iptables. To restore rules at a later date, you can run the following command:"
echo "iptables-restore < /etc/sysconfig/iptables"
sleep 5
echo ""
echo "Now configuring IPTables to be enabled automatically at startup"
chkconfig firewalld on
sleep 2
echo ""
echo "All Done!"
echo ""
echo ""
###########################################################################################################################

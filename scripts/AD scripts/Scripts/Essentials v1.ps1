#Stop, disable, and view services status
echo "modifying services"
#printspooler
Stop-Service -name Spooler -force
Set-Service -name Spooler -StartupType disabled
Get-Service -name Spooler
#RDP Usermode Port
Stop-Service -name UmRdpService
Set-Service -name UmRdpService -StartupType disabled
Get-Service -name UmRdpService
#RDP Desktop Service
Stop-Service -name SessionEnv
Set-Service -name SessionEnv -StartupType disabled
Get-Service -name SessionEnv
#RDP
Stop-Service -name TermService
Set-Service -name TermService -StartupType disabled
Get-Service -name TermService

#Set explicit inbound firewall rules
echo "setting explicit firewall rules"
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Inbound `
-LocalPort 135,139,445,49152-49157 `
-Protocol TCP `
-Action Block
New-NetFirewallRule -DisplayName "Block Kerberos" `
-Direction Inbound `
-LocalPort 88 `
-Protocol TCP `
-Action Block
#Set outbound firewall rules
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Outbound `
-LocalPort 135,139,445,49152-49157 `
-Protocol TCP `
-Action Block
New-NetFirewallRule -DisplayName "Block Kerberos" `
-Direction Outbound `
-LocalPort 88 `
-Protocol TCP `
-Action Block

#Modify LDAP Authentication Firewall rules to only allow authentication from Fedora
echo "configuring LDAP Authentication firewall rules"
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP (UDP-In)" `
-Enabled True -LocalAddress 172.20.241.40
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP (TCP-In)" `
-Enabled True -LocalAddress 172.20.241.40
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP for Global Catalog (TCP-In)" `
-Enabled True -LocalAddress 172.20.241.40
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - Secure LDAP (TCP-In)" `
-Enabled True -LocalAddress 172.20.241.40
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - Secure LDAP for Global Catalog (TCP-In)" `
-Enabled True -LocalAddress 172.20.241.40

#Configure DNS Firewall Rules to only accept from the public and private profiles
echo "configuring DNS firewall rules"
Set-NetFirewallRule -DisplayName "DNS (TCP, Incoming)" `
-Enabled True -Profile Public,Private
Set-NetFirewallRule -DisplayName "DNS (UDP, Incoming)" `
-Enabled True -Profile Public,Private

#Configure w32tm firewall rule to only accept packets from Debian NTP server
echo "configuring w32time firewall rule"
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - W32Time (NTP-UDP-In)" `
-Enabled True -LocalAddress 172.20.240.20

#Configure w32time (ntp) to point to debian now that firewall rule is set
#make sure windows time service is running
echo "preparing to set up NTP..."
net start w32time
#Ask if using AD as server or client
$Option = Read-Host -Prompt "Setup NTP as server? ('y' or 'n')"
if ($Option -eq "y") {
    #configure windows time service (NTP) as server using time.nist.gov
    echo "SETTING UP NTP SERVER"
    w32tm /config /manualpeerlist:time.nist.gov /syncfromflags:manual /reliable:yes /update
    } else {
    #configure windows time service (NTP) as client using debian
    echo "SETTING UP NTP CLIENT"
    $ServerIP = Read-Host -Prompt "Input Server IP"
    w32tm /config /manualpeerlist:$ServerIP /syncfromflags:manual /reliable:yes /update
    }

#restart the service
echo "restarting service"
net stop w32time
net start w32time
echo "service restarted, see results:"
#check peers to make sure it is active
echo "---PEERS OUTPUT---"
w32tm /query /peers
#check source to make sure proper source is listed (NOT Local CMOS Clock)
echo "---SOURCE OUTPUT---"
echo "(May not update immediately. If currently Local CMOS Clock, run 'w32tm /query /source' after script finishes)"
w32tm /query /source

#keep window open until finished reviewing
Read-Host -Prompt "Finished configuring w32time, Press Enter to continue"

#Disable a bunch of other stuff that is not needed... NOT YET TESTED
#LIST NOT COMPLETE, NOT ALL FIREWALL RULES ARE LISTED
echo "Disabling unnecessary firewall 'allow' rules"
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - NetBIOS name resolution (UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - SAM/LSA (NP-TCP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - SAM/LSA (NP-UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller (RPC)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller (RPC-EPMAP)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Active Directory Web Services (TCP-In)" `
-Enabled False

#Core Networking Rules? Can these be disabled?

Set-NetFirewallRule -DisplayName "DFS Management (DCOM-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DFS Management (SMB-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DFS Management (TCP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DFS Management (WMI-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DFS Replication (RPC-EPMAP)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DFS Replication (RPC-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server v6 (UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server v6 (UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server - Remote Service Management using SCM (RPC-in)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server (RPC-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server (RPCSS-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "DHCP Server (SMB-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "RPC (TCP, Incoming)" `
-Enabled False
Set-NetFirewallRule -DisplayName "RPC Endpoint Mapper (TCP, Incoming)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (LLMNR-UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Datagram-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Name-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Session-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (SMB-In)" -Profile Domain,Private `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (SMB-In)" -Profile Public `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Spooler Service - RPC)" -Profile Domain,Private `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Spooler Service - RPC)" -Profile Public `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Spooler Service - RPC-EPMAP)" -Profile Domain,Private `
-Enabled False
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Spooler Service - RPC-EPMAP)" -Profile Public `
-Enabled False
Set-NetFirewallRule -DisplayName "File Replication (RPC)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File Replication (RPC-EPMAP)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File Server Remote Management (DCOM-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File Server Remote Management (SMB-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "File Server Remote Management (WMI-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Kerberos Key Distribution Center - PCR (TCP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Kerberos Key Distribution Center - PCR (UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Kerberos Key Distribution Center (TCP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Kerberos Key Distribution Center (UDP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Microsoft Key Distribution Service" -Service Kdssvc `
-Enabled False
Set-NetFirewallRule -DisplayName "Microsoft Key Distribution Service" -Service RPCSS `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (DCOM-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (NP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (NPS-RPC-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (RRAS-RPC-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (Services-RPC-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Management (WMI-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Remote Access Quarantine (TCP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Routing and Remote Access (GRE-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Routing and Remote Access (PPTP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Routing and Remote Access (L2TP-In)" `
-Enabled False
Set-NetFirewallRule -DisplayName "Windows Management Instrumentation (DCOM-In)" `
-Enabled False

#state that firewall is configured
echo "Finished configuring firewall rules"

#Add AD User proftpd for Mail Binding
echo "Adding proftpd user"
New-ADUser proftpd -AccountPassword(Read-Host -AsSecureString "Input Password for user proftpd") -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true

#Open Task Scheduler
echo "opening task scheduler"
taskschd

#Keep window open until finished reviewing
Read-Host -Prompt "Finished, Press Enter to exit"

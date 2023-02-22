#Stop, disable, and view services status
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
Set-NetFirewallRule -DisplayName "DNS (TCP, Incoming)" `
-Enabled True -Profile Public,Private
Set-NetFirewallRule -DisplayName "DNS (UDP, Incoming)" `
-Enabled True -Profile Public,Private

#Configure w32tm firewall rule to only accept packets from Debian NTP server
#Follow this up with the NTP setup powershell script
Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - W32Time (NTP-UDP-In)" `
-Enabled True -LocalAddress 172.20.240.20

#Disable a bunch of other stuff that is not needed... NOT YET TESTED
#LIST NOT COMPLETE, NOT ALL FIREWALL RULES ARE LISTED
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

#Add AD User proftpd for Mail Binding
New-ADUser proftpd -AccountPassword(Read-Host -AsSecureString "Input Password for user proftpd") -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true

#Open Task Scheduler
taskschd

#Keep window open until finished reviewing
Read-Host -Prompt "Finished, Press Enter to exit"

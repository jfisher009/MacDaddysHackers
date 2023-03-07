#Stop, disable, and view services status
Write-Output "modifying services"
#printspooler
Stop-Service -name Spooler -force
Set-Service -name Spooler -StartupType disabled
Write-Output "Print Spooler service status:"
Get-Service -name Spooler
# #RDP Usermode Port
# Stop-Service -name UmRdpService
# Set-Service -name UmRdpService -StartupType disabled
# Write-Output "RDP Usermode Port service status:"
# Get-Service -name UmRdpService
# #RDP Desktop Service
# Stop-Service -name SessionEnv
# Set-Service -name SessionEnv -StartupType disabled
# Write-Output "RDP Desktop service status:"
# Get-Service -name SessionEnv
# #RDP
# Stop-Service -name TermService
# Set-Service -name TermService -StartupType disabled
# Write-Output "RDP service status:"
# Get-Service -name TermService

#Start configuring firewall rules below
Write-Output ""
#First, disable all inbound rules
Write-Output "disabling all inbound rules"
Disable-NetFirewallRule -Direction Inbound

#Set explicit inbound firewall deny rule...just to be safe...
Write-Output "setting explicit firewall rules"
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Inbound `
-LocalPort 88,135,139,445,49152-49157 `
-Protocol TCP `
-Action Block

#set inbound allow http and https
Write-Output "allowing inbound http and https"
New-NetFirewallRule -DisplayName "Allow http and https" `
-Direction Inbound `
-LocalPort 80,443 `
-Protocol TCP `
-Action Allow
Write-Output ""


#Set outbound firewall deny rule identical to inbound
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Outbound `
-LocalPort 88,135,139,445,49152-49157 `
-Protocol TCP `
-Action Block
Write-Output ""

#Begin configuring allowed rules
Write-Output "enabling good rules"
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" `
-Enabled True
# Set-NetFirewallRule -DisplayName "Google Chrome (mDNS-In)" `
# -Enabled True
Set-NetFirewallRule -DisplayName "Secure Socket Tunneling Protocol (SSTP-In)" `
-Enabled True
#Set-NetFirewallRule -DisplayName "World Wide Web Services (HTTPS Traffic-In)" `
#-Enabled True
#Set-NetFirewallRule -DisplayName "World Wide Web Services (HTTP Traffic-In)" `
#-Enabled True

# #Modify LDAP Authentication Firewall rules to only allow authentication from Fedora
# Write-Output "configuring LDAP Authentication firewall rules"
# Write-Output ""
# $MailAddr = Read-Host -Prompt "Input Mail Server IP for firewall rules"
# Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP (UDP-In)" `
# -Enabled True -LocalAddress $MailAddr
# Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP (TCP-In)" `
# -Enabled True -LocalAddress $MailAddr
# Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - LDAP for Global Catalog (TCP-In)" `
# -Enabled True -LocalAddress $MailAddr
# Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - Secure LDAP (TCP-In)" `
# -Enabled True -LocalAddress $MailAddr
# Set-NetFirewallRule -DisplayName "Active Directory Domain Controller - Secure LDAP for Global Catalog (TCP-In)" `
# -Enabled True -LocalAddress $MailAddr

# #Configure DNS Firewall Rules to only accept from the public and private profiles
# Write-Output "configuring DNS firewall rules"
# Set-NetFirewallRule -DisplayName "DNS (TCP, Incoming)" `
# -Enabled True -Profile Public,Private
# Set-NetFirewallRule -DisplayName "DNS (UDP, Incoming)" `
# -Enabled True -Profile Public,Private

#Configure w32tm firewall rule to only accept packets from Debian NTP server
Write-Output "configuring w32time firewall rule"
Write-Output ""
$NtpAddr = Read-Host -Prompt "Input external NTP Server IP"
# Set-NetFirewallRule -DisplayName "Docker - W32Time (NTP-UDP-In)" `
# -Enabled True -LocalAddress $NtpAddr
New-NetFirewallRule -DisplayName "NTP allow" `
-Direction Inbound`
-Protocol UDP `
-Action Allow `
-LocalAddress $NtpAddr
Write-Output ""

New-NetFirewallRule -DisplayName "NTP allow" `
-Direction Outbound`
-Protocol UDP `
-Action Allow `
-LocalAddress $NtpAddr
Write-Output ""

#Configure w32time (ntp) to point to debian now that firewall rule is set
#make sure windows time service is running
Write-Output "preparing to set up NTP..."
net start w32time
#Ask if using AD as server or client
$Option = Read-Host -Prompt "Setup NTP as server? ('y' or 'n')"
Write-Output ""
if ($Option -eq "y") {
    #configure windows time service (NTP) as server using time.nist.gov
    Write-Output "SETTING UP NTP SERVER"
    Write-Output ""
    w32tm /config /manualpeerlist:time.nist.gov /syncfromflags:manual /reliable:yes /update
    } else {
    #configure windows time service (NTP) as client using debian
    Write-Output "SETTING UP NTP CLIENT"
    Write-Output ""
    w32tm /config /manualpeerlist:$NtpAddr /syncfromflags:manual /reliable:yes /update
    }

#restart the service
Write-Output "restarting service"
net stop w32time
net start w32time
Write-Output "service restarted, see results:"
#check peers to make sure it is active
Write-Output "---PEERS OUTPUT---"
w32tm /query /peers
Write-Output ""
#check source to make sure proper source is listed (NOT Local CMOS Clock)
Write-Output "---SOURCE OUTPUT---"
Write-Output ""
w32tm /query /source
Write-Output "ATTENTION! May not update immediately. If currently Local CMOS Clock, run 'w32tm /query /source' after script finishes"
Write-Output ""

#keep window open until finished reviewing
Read-Host -Prompt "Finished configuring w32time, Press Enter to continue"

# #Rules I am unsure of, so I am enabling until I can test later:
# Set-NetFirewallRule -DisplayName "Core Networking - Destination Unreachable Fragmentation Needed (ICMPv4-In)" `
# -Enabled True
# Set-NetFirewallRule -DisplayName "Core Networking - Dynamic Host Configuration Protocol (DHCP-In)" `
# -Enabled True
# Set-NetFirewallRule -DisplayName "Core Networking - Internet Group Management Protocol (IGMP-In)" `
# -Enabled True
# Set-NetFirewallRule -DisplayName "Core Networking - IPHTTPS (TCP-In)" `
# -Enabled True
# Set-NetFirewallRule -DisplayName "Core Networking - Teredo (UDP-In)" `
# -Enabled True
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" `
# -Enabled True
# Write-Output ""


# #Configure outbound rules (is this necessary? default is to allow unless specified, these rules technically do nothing...)
# Write-Output "disabling unnecessary firewall outbound 'allow' rules"
# Set-NetFirewallRule -DisplayName "Active Directory Web Services (TCP-Out)" `
# -Enabled False

#Core Networking rules? Are these needed?

# Set-NetFirewallRule -DisplayName "DHCPv6 Relay Agent [Server] (UDP-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (LLMNR-UDP-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Datagram-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Name-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (NB-Session-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "File and Printer Sharing (SMB-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "Routing and Remote Access (GRE-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "Routing and Remote Access (L2TP-Out)" `
# -Enabled False
# Set-NetFirewallRule -DisplayName "Routing and Remote Access (PPTP-Out)" `
# -Enabled False

#state that firewall is configured
Write-Output "Finished configuring inbound and outbound firewall rules"
Write-Output ""

# #Add AD User proftpd for Mail Binding
# Write-Output "Adding proftpd user for binding to mail server"
# Write-Output ""
# New-ADUser proftpd -AccountPassword(Read-Host -AsSecureString "Input Password for user proftpd") -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true
# Write-Output ""

#View localgroup administrator accounts
Write-Output "Confirm Administrator accounts!!!"
net localgroup administrators
Write-Output ""
Write-Output "to view these again, run 'net localgroup administrators' in powershell"
Read-Host -Prompt "Confirm Administrators, then click ENTER to continue."

#Open Task Scheduler
Write-Output "opening task scheduler, let the threat hunting begin!"
Write-Output ""
taskschd

#Keep window open until finished reviewing
Read-Host -Prompt "Finished script, Check for errors and then press ENTER to exit"
#Stop and disable services
#printspooler
Stop-Service -name Spooler -force
Set-Service -name Spooler -StartupType disabled
#RDP
Stop-Service -name TermService
Set-Service -name TermService -StartupType disabled
#RDP Usermode Port
Stop-Service -name UmRdpService
Set-Service -name UmRdpService -StartupType disabled
#RDP Desktop Service
Stop-Service -name SessionEnv
Set-Service -name SessionEnv -StartupType disabled


#Set inbound firewall rules
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

#Add AD User proftpd
New-ADUser proftpd -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true

#Open the important apps so they can be pinned to the taskbar
cmd
@ECHO OFF
explorer.exe Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
@start iexplore

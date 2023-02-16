#Stop and disable printspooler service
Stop-Service -name Spooler -force
Set-Service -name Spooler -StartupType disabled
#Confirm status of printspooler
Get-Service -name Spooler

#Set inbound firewall rules
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Inbound `
-LocalPort 135,139,445,49152-49155 `
-Protocol TCP `
-Action Block
#Set outbound firewall rules
New-NetFirewallRule -DisplayName "Initial Block" `
-Direction Outbound `
-LocalPort 135,139,445,49152-49155 `
-Protocol TCP `
-Action Block

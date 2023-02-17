# Splunk ReadMe

# Windows 10

### change password for minion and Administrator
`net user <Account Name> <New Password>`

### See users 
`net user`

### To see from windows
add a route to the splunk machine from admin cmd at win10  `route add destination_network MASK subnet_mask  gateway_ip metric_cost`  
`route add -P 172.25.34.0 mask 255.255.255.0 172.31.34.2`  
display routes `route print`
make sure the firewall is on `netsh advfirewall set allprofiles state on`  



### Running services
search services
stop remote desktop, print spooler, remote access connection

## Useful Commands
### Status, Start, Stop, Restart
`/opt/splunk/bin/splunk status`  
`/opt/splunk/bin/splunk start`  
`/opt/splunk/bin/splunk stop`  
`/opt/splunk/bin/splunk restart`  

### Change Password
`sudo passwd root`  
change web admin password

### Login Banner
`vi /etc/motd`  
“This computer network belongs to Team # and may be used by Team # employees ONLY and for approved work-related purposes. All activity is being monitored and logged. Team # reserves the right to consent to a valid law enforcement request to search the network logs for evidence of a crime stored within the network and can be used to prosecute abuse.”   

### set splunk to listen in port 9997

### Splunk install Sysmon add on

### Change NTP Server
`vi /etc/ntp.conf`

change server to the debian ip address
run `service ntpd restart` to restart the ntp process
run `ntpq -p` to see the current ntp
`ntpstat` to see the current ntp status

### ! Copy /etc and splunk

### ! Use netstat to see what is listening

### crontab
`crontab -e`

### Iptables 



### figure out index size in splunk and see if there is a way to delete older ones


### Change Mirrors
CERN made a convenient choice of keeping CentOS 6 vault access compatible with older TLS connections
https://www.mark-gilbert.co.uk/fixing-y ... w-its-eol/

so for a legacy CentOS 6.4 the /etc/yum.repos.d/CentOS-Base.repo

`[C6.4-base]
name=CentOS-6.4 - Base
baseurl=http://linuxsoft.cern.ch/centos-vault/6.4/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
metadata_expire=never`

`[C6.4-updates]
name=CentOS-6.4 - Updates
baseurl=http://linuxsoft.cern.ch/centos-vault/6 ... $basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
metadata_expire=never`

`[C6.4-extras]
name=CentOS-6.4 - Extras
baseurl=http://linuxsoft.cern.ch/centos-vault/6 ... $basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
enabled=1
metadata_expire=never`

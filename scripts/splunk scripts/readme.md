# Splunk ReadMe



## Useful Commands
### Status, Start, Stop, Restart
`/opt/splunk/bin/splunk status`  
`/opt/splunk/bin/splunk start`  
`/opt/splunk/bin/splunk stop`  
`/opt/splunk/bin/splunk restart`  

### Change Password
`sudo passwd root`  

### Login Banner
`vi /etc/motd`  
“This computer network belongs to Team # and may be used by Team # employees ONLY and for approved work-related purposes. All activity is being monitored and logged. Team # reserves the right to consent to a valid law enforcement request to search the network logs for evidence of a crime stored within the network and can be used to prosecute abuse.”   

### Change NTP Server
`vi /etc/ntp.conf`
change server to the debian ip address
run `service ntpd restart` to restart the ntp process
run `ntpq -p` to see the current ntp
`ntpstat` to see the current ntp status


### To see from windows
add a route to the splunk machine from admin cmd at win10 `add route...`  `route add destination_network MASK subnet_mask  gateway_ip metric_cost`
make sure the firewall is on `netsh advfirewall set allprofiles state on`  


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

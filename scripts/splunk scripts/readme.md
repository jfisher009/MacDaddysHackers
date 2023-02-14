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

### Change NTP Server
`vi /etc/ntp.conf`
change server to the debian ip address
run `service ntpd restart` to restart the ntp process
run `ntpq -p` to see the current ntp



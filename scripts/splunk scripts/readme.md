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
add a route to the splunk machine from admin cmd at win10 `add route...`  
make sure the firewall is on `netsh advfirewall set allprofiles state on`  



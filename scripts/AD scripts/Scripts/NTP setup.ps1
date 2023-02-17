#make sure windows time service is running
net start w32time
#configure windows time service (NTP), change the manualpeerlist value to the NTP source. If debian, use it's internal IP.
w32tm /config /manualpeerlist:time.nist.gov /syncfromflags:manual /reliable:yes /update
#restart the service
net stop w32time
net start w32time
#check peers to make sure it is active
w32tm /query /peers
#check source to make sure proper source is listed (NOT Local CMOS Clock)
w32tm /query /source

#keep window open until finished reviewing
Read-Host -Prompt "Finished, Press Enter to exit"

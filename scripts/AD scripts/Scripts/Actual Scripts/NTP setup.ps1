net start w32time
w32tm /config /manualpeerlist:pool.ntp.org /syncfromflags:manual /reliable:yes /update
net stop w32time
net start w32time
w32tm /monitor
w32tm /query /status
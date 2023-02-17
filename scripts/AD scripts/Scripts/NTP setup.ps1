#make sure windows time service is running
net start w32time
#Ask if using AD as server or client
$Option = Read-Host -Prompt "Setup NTP as server? ('y' or 'n')"
if ($Option -eq "y") {
    #configure windows time service (NTP) as server using time.nist.gov
    echo "SETTING UP NTP SERVER"
    w32tm /config /manualpeerlist:time.nist.gov /syncfromflags:manual /reliable:yes /update
    } else {
    #configure windows time service (NTP) as client using debian
    echo "SETTING UP NTP CLIENT"
    $ServerIP = Read-Host -Prompt "Input Server IP"
    w32tm /config /manualpeerlist:$ServerIP /syncfromflags:manual /reliable:yes /update
    }

#restart the service
net stop w32time
net start w32time
#check peers to make sure it is active
echo "---PEERS OUTPUT---"
w32tm /query /peers
#check source to make sure proper source is listed (NOT Local CMOS Clock)
echo "---SOURCE OUTPUT---"
w32tm /query /source

#keep window open until finished reviewing
Read-Host -Prompt "Finished, Press Enter to exit"

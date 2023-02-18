#! /bin/bash
# Get current time
now=$(date + "%T")
echo "Time: $now"

RANGE1=10.140.1.0/24
RANGE2=172.18.0.0/16
RANGE3=192.168.251.0/24
RANGE4=10.128.0.0/12

# Use the time to get the relevant logs TODO:(change the recieve time to be 15 minutes prior to $now)
RESULT=curl -X GET "https://<firewall>/api/?key=<apikey>&type=log&log-type=traffic&query=(receive_time geq '2012/06/22 08:00:00')"

# TODO: alert if any connections are made from these ip ranges.

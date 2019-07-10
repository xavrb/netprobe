#!/bin/bash
# Test for network conection
 
ifconfig | grep -v  lo | grep -v et
let "onlinestats = 0"
let "offlinestats = 0"
while true
do
	now="$(date)"
	echo "$now"
	if [[ $(cat /sys/class/net/wlan0/carrier) = 1 ]]
		then  echo "online, trying to reach cloudflare"
			let "onlinestats+=1"
		else let "offlinestats+=1"
			echo "No internet connection, probe failed."
	fi
	echo "Number of succesfull hits to TANGO> "
	echo $onlinestats
	echo "Times I failed to hit tango (wifi dropped connection) "
	echo $offlinestats
 
done

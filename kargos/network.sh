#!/bin/bash

DEV=$(ip addr | awk '/state UP/ {print $2}' | sed 's/.$//')

if [ $DEV = wlp1s0 ];then
	if [ $(cat /sys/class/net/$DEV/operstate) = up ];then
		SSID=$(iwgetid -r)
		OUTPUT="🌐 Connected: $SSID"
	else
		OUTPUT="🚫 Not Connected"
	fi
fi

if [ $DEV = enp2s0 ];then
	if [ $(cat /sys/class/net/$DEV/operstate) = up ];then
		SSID=$(iwgetid -r)
		OUTPUT="🌐 Conneted: $SSID"
	else
		OUTPUT="🚫 Not Connected"
	fi
fi

echo "$OUTPUT | bash='plasmawindowed org.kde.plasma.networkmanagement'"
echo "---"
echo "Local IP: $(ip -br a | grep "wlp1s0" | awk 'NR==1 {print $3}')"
echo "Default gateway: $(ip r | awk 'NR==1 {print $3}')"
echo "DNS: $(resolvectl | grep "Current DNS Server" | awk 'NR==1 {print $4}')"
#echo "Public IP $(dig +short myip.opendns.com @resolver1.opendns.com)"

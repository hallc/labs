#!/bin/bash

case "$1" in
	start)
		IP=`adb shell ip -f inet addr show wlan0 | grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' -o | head -1`
		if [ "$IP" == "" ]; then
			exit 1
		fi
		adb tcpip 5555
		adb connect $IP:5555
	;;
	stop)
		adb usb
		adb disconnect
	;;
	status)
		adb devices
	;;
	*)
		echo "Usage: adbwifi.sh  [start|stop|status]"
	;;
esac

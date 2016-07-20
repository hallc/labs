#!/bin/bash

case "$1" in
	mk)
		mksim.py
	;;
	rm)
		rmsim.py
	;;
	reset)
		resetsim.py
	;;
	list)
		xcrun simctl list
	;;
	*)
		echo "Usage: simctl.sh [mk|rm|reset|list]"
	;;
esac


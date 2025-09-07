#!/bin/sh

if [ $# != 1 ]; then
	echo "Usage: netpid.sh port"
	exit 1
fi

lsof -n -i4TCP:$1 | grep LISTEN

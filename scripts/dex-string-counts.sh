#!/bin/sh

if [ $# -ne 1 ] || [ ! -e $1 ]; then
	echo "Usage: $0 apk"
	exit 1
fi

jar xvf $1 classes.dex &> /dev/null && hexdump -s 56 -n 4 -e '1/4 "%d\n"' classes.dex && rm classes.dex

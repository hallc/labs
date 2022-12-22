#!/bin/bash

function usage() {
	echo "Usage: index.sh [on|off] path"
}

if [ $# != 2 ] || ! [ -d "$2" ] || ( [ $1 != "on" ] && [ $1 != "off" ] ); then
	usage
	exit 1
fi

if [ $1 = "on" ]; then
	touch "$1/.metadata_never_index"
else
	rm "$1/.metadata_never_index"
fi

mdutil -i $1 "$2"

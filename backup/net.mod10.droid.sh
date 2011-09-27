#!/bin/sh

drive="/Volumes/DROID"
src="$HOME/Music/iTunes/iTunes Media/Podcasts"
dst="$drive/usb/podcasts"

if [ -d "$drive" ]; then
	/usr/local/bin/growlnotify -t "DROID" -m "Synchronizing podcasts."
	if [ ! -d "$dst" ]; then
		mkdir -p "$dst"
	fi
	rsync -aq --del "$src" "$dst"
	/usr/local/bin/growlnotify -t "DROID" -m "Synchronization complete."
fi

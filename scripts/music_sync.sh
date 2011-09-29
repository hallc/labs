#!/bin/sh

drive="/Volumes/TDI"
src="$HOME/Music/iTunes/iTunes Media/Music"
dst="$drive"

if [ -d "$drive" ]; then
	/usr/local/bin/growlnotify -t "MUSIC" -m "Synchronizing music."
	if [ ! -d "$dst" ]; then
		mkdir -p "$dst"
	fi
	rsync -av --del "$src" "$dst"
	/usr/local/bin/growlnotify -t "MUSIC" -m "Music synchronization complete."
fi


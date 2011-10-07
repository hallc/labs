#!/bin/sh

drive="/Volumes/BACKUP"
src="$HOME/Music/iTunes/iTunes Media/Music/"
dst="$drive/Backup/Music"

if [ -d "$drive" ]; then
	/usr/local/bin/growlnotify -t "BACKUP" -m "Starting music backup."
	if [ ! -d "$dst" ]; then
		mkdir -p "$dst"
	fi
	rsync -avh --del "$src" "$dst"
    /usr/local/bin/growlnotify -t "BACKUP" -m "Music backup complete."
fi

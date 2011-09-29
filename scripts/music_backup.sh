#!/bin/sh

drive="/Volumes/BACKUP"
src="$HOME/Music/iTunes/iTunes Media/Music/"
dst="$drive/Backup/Music"

if [ -d "$drive" ]; then
	/usr/local/bin/growlnotify -t "BACKUP" -m "Starting local backup."

	if [ ! -d "$dst" ]; then
		mkdir -p "$dst"
	fi
	rsync -aq --del "$src" "$dst"

    /usr/local/bin/growlnotify -t "BACKUP" -m "Local backup complete."
fi

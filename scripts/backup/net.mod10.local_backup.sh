#!/bin/sh

drive="/Volumes/BACKUP"
src1="$HOME/Music/iTunes/iTunes Media/Music/"
dst1="$drive/Backup/Music"
src2="$HOME/Pictures/Albums/"
dst2="$drive/Backup/Albums"

if [ -d "$drive" ]; then
	/usr/local/bin/growlnotify -t "BACKUP" -m "Starting local backup."

	if [ ! -d "$dst1" ]; then
		mkdir -p "$dst1"
	fi
	rsync -aq --del "$src1" "$dst1"

	if [ ! -d "$dst2" ]; then
		mkdir -p "$dst2"
	fi
    rsync -aq --del "$src2" "$dst2"

    /usr/local/bin/growlnotify -t "BACKUP" -m "Local backup complete."
fi

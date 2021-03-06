#!/bin/bash

drive="/Volumes/MUSIC"
src="$HOME/Music/iTunes/iTunes Media/Music"
dst="$drive"

if [ -d "$drive" ]; then
	terminal-notifier -group "$0" -title "MUSIC" -message "Synchronizing music."
	if [ ! -d "$dst" ]; then
		mkdir -p "$dst"
	fi
	rsync -avh --del "$src" "$dst"
	terminal-notifier -group "$0" -title "MUSIC" -message "Music synchronization complete."
fi


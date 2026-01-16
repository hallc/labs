#!/bin/sh

for file in $(find ~/.android/avd -name 'config.ini' -mindepth 2 -maxdepth 2)
do
	sed 's/hw.audioInput=yes/hw.audioInput=no/' < "$file" "$file.tmp"
	mv "$file.tmp" "$file"
done

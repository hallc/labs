#!/bin/sh

account="7069@usw-s007.rsync.net"

/usr/local/bin/growlnotify -t "BACKUP" -m "Starting home backup."
time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Pictures" --include "/Projects" --include "/Sites" --exclude "/*" --exclude "/Pictures/Albums" ~/ $account:$USER &> $HOME/.backup.log
/usr/local/bin/growlnotify -t "BACKUP" -m "Home backup complete."


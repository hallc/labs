#!/bin/bash

/usr/local/bin/growlnotify -t "BACKUP" -m "Starting backup."
(time rsync -azvh --del --include="/Desktop" --include "/Documents" --include "/Music" --include "/Pictures" --include "/Projects" --include "/Sites" --exclude "/*" ~/ $RSYNC_ACCOUNT:~/) &> ~/.backup.log
/usr/local/bin/growlnotify -t "BACKUP" -m "Backup complete."


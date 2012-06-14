#!/bin/bash

/usr/local/bin/growlnotify -t "BACKUP" -m "Starting local backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Music" --include "/Pictures" --include "/Projects" --include "/Sites" --include "/dominions3" --exclude "/*" ~/ $LOCAL_RSYNC_ACCOUNT:$USER) &> ~/.local_backup.log
/usr/local/bin/growlnotify -t "BACKUP" -m "Local backup complete."


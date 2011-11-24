#!/bin/sh

/usr/local/bin/growlnotify -t "BACKUP" -m "Starting remote backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Pictures" --include "/Projects" --include "/Sites" --exclude "/Pictures/*.aplibrary" --exclude "/*" ~/ $RSYNC_ACCOUNT:$USER) &> $HOME/.backup.log
/usr/local/bin/growlnotify -t "BACKUP" -m "Remote backup complete."


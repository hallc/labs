#!/bin/bash

/usr/local/bin/growlnotify -t "BACKUP" -m "Starting remote backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Pictures" --exclude "/Pictures/Aperture Library.aplibrary/Thumbnails/*" --exclude "/Pictures/Aperture Library.aplibrary/Previews/*" --include "/Projects" --include "/Sites" --exclude "/*" ~/ $REMOTE_RSYNC_ACCOUNT:$USER) &> ~/.remote_backup.log
/usr/local/bin/growlnotify -t "BACKUP" -m "Remote backup complete."


#!/bin/bash

terminal-notifier -title "BACKUP" -message "Starting remote backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Pictures" --exclude "/Pictures/Aperture Library.aplibrary/Thumbnails/*" --exclude "/Pictures/Aperture Library.aplibrary/Previews/*" --include "/Projects" --include "/Sites" --include "/dominions3" --exclude "/*" ~/ $REMOTE_RSYNC_ACCOUNT:$USER) &> ~/.remote_backup.log
terminal-notifier -title "BACKUP" -message "Remote backup complete."


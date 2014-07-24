#!/bin/bash

sleep 60

terminal-notifier -group "$0" -title "BACKUP" -message "Starting remote backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Pictures" --exclude "/Pictures/Aperture Library.aplibrary/Thumbnails/*" --exclude "/Pictures/Aperture Library.aplibrary/Previews/*" --include "/Projects" --include "/Sites" --exclude "/*" ~/ $REMOTE_RSYNC_ACCOUNT:$USER) &> ~/.remote_backup.log
terminal-notifier -group "$0" -title "BACKUP" -message "Remote backup complete."


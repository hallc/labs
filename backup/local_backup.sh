#!/bin/bash

terminal-notifier -group "$0" -title "BACKUP" -message "Starting local backup."
(time rsync -azvh --del --delete-excluded --include="/Desktop" --include "/Documents" --include "/Music" --include "/Pictures" --include "/Projects" --include "/Sites" --include "/dominions3" --exclude "/*" ~/ $LOCAL_RSYNC_ACCOUNT:$USER) &> ~/.local_backup.log
terminal-notifier -group "$0" -title "BACKUP" -message "Local backup complete."


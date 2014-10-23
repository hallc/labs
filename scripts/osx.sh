#!/bin/bash

# Show the ~Library directory
chflags nohidden ~/Library

# Hide the directories Remote Desktop creates under ~Documents
chflags hidden ~/Documents/RDC\ Connections
chflags hidden ~/Documents/Microsoft\ User\ Data

# Suspend to RAM only
sudo pmset -a hibernatemode 0

# Start apache on boot
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Remove apps that no longer exist from the "Open With" menu
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user

# Install X11 Libs
xcode-select --install


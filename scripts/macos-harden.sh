#!/bin/bash

# Destroy File Vault keys when the system enters standby mode
sudo pmset destroyfvkeyonstandby 1

# Power off memory when the system enters standby mode
#sudo pmset -a hibernatemode 25

# Set the default save target to the local disk
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the quarantine event logs
cat /dev/null > ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2
chmod 444 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV2

# Disable multicast advertisements
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

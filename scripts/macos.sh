#!/bin/bash

# Disable Safari promotion
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 12.99

defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt -date '2050-01-01T00:00:00Z'
defaults write com.apple.Safari DefaultBrowserPromptingState -int 2

# Disable upgrade notifications
defaults write com.apple.SoftwareUpdate MajorOSUserNotificationDate -date '2050-01-01T00:00:00Z'

# Disable Hyperlink Auditing Beacon
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2HyperlinkAuditingEnabled -bool false

# Disable HotPlug for cameras
defaults write com.apple.ImageCapture disableHotPlug -bool YES

# Prevent Apple Music from launching automatically
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

# Disable metadata file creation on network and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable captive portal detection
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false

# Install command line developer tools
xcode-select --install

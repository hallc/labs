#!/bin/bash

# Suspend to RAM only
sudo pmset -a hibernatemode 0

# Disable Safari promotion
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt -date '2050-01-01T00:00:00Z'
defaults write com.apple.Safari DefaultBrowserPromptingState -int 2

# Disable Hyperlink Auditing Beacon
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2HyperlinkAuditingEnabled -bool false

# Disable HotPlug for cameras
defaults write com.apple.ImageCapture disableHotPlug -bool YES

# Disable metadata file creation on network and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable captive portal detection
defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -boolean false

# Install command line developer tools
xcode-select --install


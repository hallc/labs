#!/bin/bash

# Show the ~Library directory
chflags nohidden ~/Library

# Suspend to RAM only
sudo pmset -a hibernatemode 0

# Start apache on boot
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Remove apps that no longer exist from the "Open With" menu
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user

# Install X11 Libs
xcode-select --install

# Disable Safari promotion
defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99

defaults write com.apple.Safari DefaultBrowserDateOfLastPrompt -date '2050-01-01T00:00:00Z'
defaults write com.apple.Safari DefaultBrowserPromptingState -int 2

# Disable HotPlug for cameras
#defaults write com.apple.ImageCapture disableHotPlug -bool YES


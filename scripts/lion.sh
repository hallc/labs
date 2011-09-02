#!/bin/sh

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
defaults write -g ApplePressAndHoldEnabled -bool false
chflags nohidden ~/Library/
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool NO
#defaults write -g AppleShowScrollBars -string Always

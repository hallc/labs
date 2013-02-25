#!/bin/bash

chflags nohidden ~/Library
chflags hidden ~/Documents/RDC\ Connections
chflags hidden ~/Documents/Microsoft\ User\ Data

#defaults write -g ApplePressAndHoldEnabled -bool false

#sudo systemsetup -setkernelbootarchitecture i386
#sudo systemsetup -setkernelbootarchitecture x86_64

sudo pmset -a hibernatemode 0

/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user


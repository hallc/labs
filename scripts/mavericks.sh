#!/bin/bash

chflags nohidden ~/Library
chflags hidden ~/Documents/RDC\ Connections
chflags hidden ~/Documents/Microsoft\ User\ Data

sudo pmset -a hibernatemode 0

/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user


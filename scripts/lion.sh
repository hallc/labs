#!/bin/sh

chflags nohidden ~/Library
chflags hidden ~/Documents/RDC\ Connections

sudo systemsetup -setkernelbootarchitecture i386
#sudo systemsetup -setkernelbootarchitecture x86_64


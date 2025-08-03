#!/bin/sh

xattr -d -r com.apple.quarantine "$@"
xattr -d -r com.apple.metadata:kMDItemWhereFroms "$@"

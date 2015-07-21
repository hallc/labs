#!/bin/bash

for uid in `xcrun simctl list | grep Shutdown | sed 's/[^\(]*(\([^)]*\)).*/\1/'`; do
	xcrun simctl erase $uid
done


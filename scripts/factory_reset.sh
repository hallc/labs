#!/bin/bash

for uid in `xcrun simctl list | grep Shutdown | sed -E 's/.*([A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}).*/\1/'`; do
	xcrun simctl erase $uid
done

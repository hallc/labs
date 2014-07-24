#!/bin/bash

for file in `find ~/.android/avd/ -name emulator-user.ini`; do
	sed -i 's/window\.y = .*/window.y = 0/' $file
done

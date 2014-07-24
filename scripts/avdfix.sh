#!/bin/bash

for file in `find ~/.android/avd/ -name emulator-user.ini`; do
	sed -i -e 's/window\.y = .*/window.y = 0/' "$file"
	sed -i -e 's/window\.x = .*/window.x = 0/' "$file"
done

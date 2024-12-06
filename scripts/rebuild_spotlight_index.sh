#!/bin/bash

echo -n "Forcing Spotlight index rebuild... "

sudo mdutil -Eai off &> /dev/null
sleep 3
sudo mdutil -Eai on &> /dev/null

echo "done!"

#!/bin/bash

echo "$2" | sed "s/\(.\{$1\}\).*/\1/"


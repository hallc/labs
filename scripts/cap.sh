#!/bin/bash

amount=$1
units=$2

if [ $units == "l" ]; then
	operation="/"
else
	operation="*"
fi

echo "$amount $operation 0.016387064" | bc
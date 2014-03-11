#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: mkcert.sh name";
	exit 1
fi

name=$1

openssl genrsa -out $name.key 4096
openssl req -new -key $name.key -out $name.csr
openssl x509 -req -days 1095 -in $name.csr -signkey $name.key > $name.crt


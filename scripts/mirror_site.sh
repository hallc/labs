#!/bin/sh

wget \
  --mirror \
  --page-requisites \
  --convert-links \
  --adjust-extension \
  --no-verbose \
  --level=inf \
  $1

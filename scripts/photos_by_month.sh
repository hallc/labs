#!/bin/sh

exiftool -d %Y/%m "-directory<FileModifyDate" *

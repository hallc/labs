#!/bin/sh

exiftool -d %Y "-directory<FileModifyDate" *

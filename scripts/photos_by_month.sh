#!/bin/bash

exiftool -d %Y/%m "-directory<FileModifyDate" *

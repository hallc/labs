#!/bin/bash

(time rsync -azvh --del --delete-excluded /home/ /mnt/s3) &> ~/.backup.log


#!/bin/bash

mkdir -p /home/aleksandar/.local/share/rclone-backup-logs
now=$(date +'log-%Y-%m-%d.txt')
log_file="/home/aleksandar/.local/share/rclone-backup-logs/$now"
# --checkers 2, default is 8. This will lower impact on pc, but will last longer.
# It should make upload less noticable if I'm already doing something
/home/aleksandar/.nix-profile/bin/rclone sync --progress --log-file=$log_file --log-level INFO --checkers=2 /home/aleksandar/HDD/Media KoofrEncrpypted: 
echo "------------------------------------------" >> $log_file
echo "" >> $log_file
# rclone sync --progress /home/aleksandar/HDD/Media KoofrEncrpypted:


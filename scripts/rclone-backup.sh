#!/bin/bash


# Backup secrets every time before backing up to the cloud
bash $HOME/.dotfiles/scripts/backup_secrets.bash backup

# Create log folder
mkdir -p $XDG_STATE_HOME/rclone-backup-log

# Log file name
now=$(date +'log-%Y-%m-%d.txt')
log_file="$XDG_STATE_HOME/rclone-backup-log/$now"

# Nix will put rclone in path bellow
# --checkers 2, default is 8. This will lower impact on pc, but will last longer.
# It should make upload less noticable if I'm already doing something
# # I'ts okay since this is usually done with a cron job.
/home/aleksandar/.nix-profile/bin/rclone sync --progress --log-file=$log_file --log-level INFO --checkers=2 /home/aleksandar/HDD/Media KoofrEncrpypted: 
echo "------------------------------------------" >> $log_file
echo "" >> $log_file
# rclone sync --progress /home/aleksandar/HDD/Media KoofrEncrpypted:



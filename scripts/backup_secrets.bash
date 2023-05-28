#!/bin/bash

# First param is folder that should be backed up
# Second params is name for the saved folder
backup_single() {
  where=$1
  temp_file=/tmp/$2.tar

  # Only do it if dest is folder
  if [ -d "$where" ]
  then
    # Convert folder to single file 
    tar -cf $temp_file -C $where .
    # Encrypt that file
    ansible-vault encrypt --vault-password-file ~/.config/ansible-vault-key.txt $temp_file
    # Move encrypted file to hard drive
    mv -f $temp_file /media/hdd500/Media/Documents/Secrets
  else
    echo "Folder $where does not exist."
  fi

}

backup_all() {
  # Backup ssh
  backup_single $HOME/.ssh ssh
  # Backup rclone config
  backup_single $HOME/.config/rclone rclone
}


restore_single() {
  where=$1
  name=$2.tar

  if [ -d "$where" ] 
  then
    # Do not overwrite data if exists
    echo "Folder already exists. Aborting." 
  else
    # Copy encrypted file to dest parent folder
    cp /media/hdd500/Media/Documents/Secrets/$name $where.tar
    # Decrypt it. It will return tar archive
    ansible-vault decrypt --vault-password-file ~/.config/ansible-vault-key.txt $where.tar
    # Make dir to extract
    mkdir -p $where
    # Extract to destination
    tar -xf "$where.tar" -C $where
    # Remove leftover tar file 
    rm $where.tar
  fi
}

restore_all() {
  # Restore ssh
  restore_single $HOME/.ssh ssh
  # Restore rclone
  restore_single $HOME/.config/rclone rclone
}

if [ $1 = "backup" ]
then
  # backup_secrets.bash backup
  echo "Backing up secrets"
  backup_all
elif [ $1 = "restore" ]
then
  # backup_secrets.bash restore
  echo "Restoring secrets"
  restore_all
else
  # Invalid command passed (or no command)
  echo "Invalid command"
  exit 1
fi


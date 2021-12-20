#!/bin/bash

sudo apt install git curl
git clone --branch main https://github.com/apstanisic/dotfiles.git ~/.dotfiles.temp

# Add big echo
. ~/.dotfiles.temp/machine-setup/big-echo.sh

# Init SSH
sh ~/.dotfiles.temp/machine-setup/create-ssh.sh

# Wait until SSH is added to github
BigEcho "Add SSH public key to Github, since we will need it later"

while :
do
  sleep 1
  read -p 'Type "yes" when you added the key to GitHub: ' confirmed
  echo "Entered: $confirmed"

  if [ "$confirmed" = "yes" ]
  then
    echo "Continuing"
    break
  else
    echo 'Enter "yes" to continue'
  fi

done

BigEcho "Key added, we are continuing installation"

BigEcho "Cloning dotfiles"
git clone --branch main git@github.com:apstanisic/dotfiles.git ~/dotfiles
BigEcho "Finished cloning dotfiles"

rm -r ~/.dotfiles.temp

#
sh ~/.dotfiles/machine-setup/setup-dev-tools.sh
sh ~/.dotfiles/machine-setup/setup-gui-tools.sh

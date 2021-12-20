#!/bin/sh

export DEBIAN_FRONTEND="noninteractive"

sudo apt install git curl
git clone --branch main https://github.com/apstanisic/dotfiles.git ~/.dotfiles.temp

# Add big echo
. ~/.dotfile.temp/machine-setup/big-echo.sh

# Init SSH
sh ~/.dotfile.temp/machine-setup/create-ssh.sh

# Wait until SSH is added to github
BigEcho "Add SSH public key to Github, since we will need it later"
while :
do
  read -p 'Type "yes" when you added the key: ' confirmed
  if [ $confirmed = "yes" ]; then
    break
  else
    echo 'Enter "yes" to continue'
  fi
done
echo "Key added, we are continuing installation"

BigEcho "Cloning dotfiles"
git clone --branch main git@github.com:apstanisic/dotfiles.git ~/dotfiles
BigEcho "Finished cloning dotfiles"

rm -r ~/.dotfiles.temp

#
sh ~/.dotfile/machine-setup/setup-dev-tools.sh
sh ~/.dotfile/machine-setup/setup-gui-tools.sh

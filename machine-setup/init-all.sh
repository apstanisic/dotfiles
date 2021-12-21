#!/bin/bash

# sudo apt install git curl
# git clone --branch main https://github.com/apstanisic/dotfiles.git ~/.dotfiles.temp


# Add big echo
. $HOME/dotfiles/machine-setup/big-echo.sh

BigEcho "Setting root password"
sudo passwd root

# Init SSH
sh ~/dotfiles/machine-setup/setup-ssh.sh

# Wait until SSH is added to github
BigEcho "Add SSH public key to Github, since we will need it later"


while true;
do
  read -p 'Type "yes" when you have added the key to GitHub: ' confirmed
  echo "$confirmed" ;

  if [ "$confirmed" = "yes" ]
  then
    echo "Continuing"
    break
  else
    echo 'Enter "yes" to continue'
  fi
done

BigEcho "Key added, we are continuing installation"

#
sh ~/dotfiles/machine-setup/setup-dev-tools.sh
sh ~/dotfiles/machine-setup/setup-gui-tools.sh

cd ~/dotfiles && git remote set-url origin git@github.com:apstanisic/dotfiles.git
cd ~
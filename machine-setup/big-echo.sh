#!/bin/bash

Yellow='\033[1;33m'
NoColor='\033[0m'

BigEcho() {
  echo "##############################################"
  echo "#"
  echo "# ${Yellow} $1 ${NoColor}"
  echo "#"
  echo "##############################################"

}

AptInstall () {
  BigEcho "Installing $1"
  apt install -y $1
  BigEcho "Installed $1"
}

FlatpakInstall () {
  BigEcho "Installing $1"
  flatpak install flathub $1
  BigEcho "Installed $1"
}

NixInstall () {
  BigEcho "Installing $1"
  nix-env -iA $1
  BigEcho "Installed $1"
}

VoltaInstall () {
  BigEcho "Installing $1"
  volta install $1
  BigEcho "Installed $1"
}

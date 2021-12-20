#!/bin/bash

bold_yellow=$(tput bold && tput setaf 11)
normal=$(tput sgr0)


BigEcho() {
  echo "##############################################"
  echo "#"
  echo "# ${bold_yellow} $1 ${normal}"
  echo "#"
  echo "##############################################"

}

AptInstall () {
  BigEcho "Installing $1"
  DEBIAN_FRONTEND="noninteractive" sudo apt install -y $1
  BigEcho "Installed $1"
}

FlatpakInstall () {
  BigEcho "Installing $1"
  DEBIAN_FRONTEND="noninteractive" flatpak install -y flathub  $1
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

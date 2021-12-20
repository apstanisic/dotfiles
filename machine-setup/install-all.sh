#!/bin/sh

export DEBIAN_FRONTEND="noninteractive"

sudo apt install git
git clone git@github.com:apstanisic/dotfiles.git ~/.dotfiles.temp

sh ~/.dotfile.temp/machine-setup/setup-dev-tools.sh
sh ~/.dotfile.temp/machine-setup/setup-gui-tools.sh

rm -r ~/.dotfiles.temp
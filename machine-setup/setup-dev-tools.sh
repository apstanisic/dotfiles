#!/bin/bash

. $HOME/dotfiles/machine-setup/big-echo.sh

#
# Packages from repositories
#
BigEcho "Updating repositories"
sudo apt update -y & sudo apt upgrade -y
BigEcho "Finished updating repositories"

AptInstall zsh

BigEcho "Setting zsh as default shell"
chsh -s /usr/bin/zsh aleksandar
BigEcho "Finished settings zsh as default shell"

# needed for tools
AptInstall apt-transport-https
AptInstall git
AptInstall vim
AptInstall curl
AptInstall wget
# copy manager
AptInstall xclip
# multiplexer
AptInstall tmux
# system monitor
AptInstall htop
# see what files takes space
AptInstall ncdu
# open ssl
AptInstall libssl-dev
# needed to build software
AptInstall build-essential
# compression
AptInstall p7zip-full
# android tools
AptInstall android-tools-adb
AptInstall android-tools-fastboot
#
AptInstall sqlite3
AptInstall neovim
# dotfile manager
AptInstall stow
# docker
AptInstall docker.io
AptInstall docker-compose

#
# Other installs and config
# We first need our dotfiles, so we can have configured paths and aliases
#



# cloning problem
if [ -d "$HOME/dotfiles" ]; then
  BigEcho "dotfiles already cloned"
else
  BigEcho "Cloning dotfiles"
  git clone --branch main git@github.com:apstanisic/dotfiles.git ~/dotfiles
  BigEcho "Finished cloning dotfiles"
fi


# echo "Make paths and aliases available in shell"
. ~/dotfiles/.config/paths
. ~/dotfiles/.config/aliases

BigEcho "Restoring config"
sh ~/dotfiles/machine-setup/sync-dotfiles.sh
BigEcho "Finished restoring config"


BigEcho "Installing Nix"
curl -L https://nixos.org/nix/install | sh
BigEcho "Installed Nix"

# Install volta (Node installer)
BigEcho "Installing Volta"
curl https://get.volta.sh | bash
BigEcho "Installed Volta"

# Install Node
VoltaInstall node@lts
# Install Yarn and pnpm
VoltaInstall yarn pnpm
# Prettier git diff
VoltaInstall diff-so-fancy
# Global Typescript
VoltaInstall typescript
# Cheatsheet
VoltaInstall tldr
# Nest CLI
VoltaInstall @nestjs/cli

# BigEcho "Installing Starship prompt"
# Custom bin folder
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --bin-dir $HOME/.local/bin

# Deno 
NixInstall nixpkgs.deno
# shell prompt
NixInstall nixpkgs.starship
# github cli
NixInstall nixpkgs.gh
# better tmux 
NixInstall nixpkgs.zellij

# BigEcho "Finished installing Starship prompt"



# echo  "Installing zim (framework for zsh)"
# curl -fLo ~/.zim/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh --create-dirs
# zsh ~/.zim/zimfw.zsh install
# echo  "Finished installing zim"

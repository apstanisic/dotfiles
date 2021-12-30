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
# open ssl
AptInstall libssl-dev
# needed to build software
AptInstall build-essential
# compression
AptInstall p7zip-full
# android tools
AptInstall android-tools-adb
AptInstall android-tools-fastboot
# Sqlite
AptInstall sqlite3
# dotfile manager
AptInstall stow
# docker
AptInstall docker.io

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
# Source NIX so we can use it later
# We need to source it after Nix is installed
. /home/aleksandar/.nix-profile/etc/profile.d/nix.sh;
BigEcho "Installed Nix"

# Install volta (Node installer)
BigEcho "Installing Volta"
curl https://get.volta.sh | bash
BigEcho "Installed Volta"

# Install Node
VoltaInstall node@lts
# Some packages
VoltaInstall yarn
VoltaInstall pnpm
VoltaInstall typescript
VoltaInstall @nestjs/cli
# Cheatsheet
VoltaInstall tldr


# Deno 
NixInstall nixpkgs.deno
# shell prompt
NixInstall nixpkgs.starship
# github cli
NixInstall nixpkgs.gh
# better tmux 
NixInstall nixpkgs.zellij
# better cat
NixInstall nixpkgs.bat
# better ls
NixInstall nixpkgs.exa
# better grep
NixInstall nixpkgs.ripgrep
# Fuzzy finder
NixInstall nixpkgs.fzf
# better git diff
NixInstall nixpkgs.delta
# better find
NixInstall nixpkgs.fd
# Neovim
NixInstall nixpkgs.neovim
# see what files takes space
NixInstall nixpkgs.ncdu
# Htop
NixInstall nixpkgs.htop
# multiplexer
NixInstall nixpkgs.tmux
# docker compose
NixInstall nixpkgs.docker-compose

# echo  "Installing zim (framework for zsh)"
# curl -fLo ~/.zim/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh --create-dirs
# zsh ~/.zim/zimfw.zsh install
# echo  "Finished installing zim"

#!/bin/bash

. $HOME/dotfiles/machine-setup/big-echo.sh

#
# Packages from repositories
#
BigEcho "Updating repositories"
sudo apt update -y & sudo apt upgrade -y
BigEcho "Finished updating repositories"

AptInstall curl
AptInstall zsh

# Nix only needs curl and xz-utils to be installed
BigEcho "Installing Nix"
curl -L https://nixos.org/nix/install | sh
# Source NIX so we can use it later
# We need to source it after Nix is installed
. /home/aleksandar/.nix-profile/etc/profile.d/nix.sh;
BigEcho "Installed Nix"


BigEcho "Setting zsh as default shell"
chsh -s /usr/bin/zsh aleksandar
BigEcho "Finished settings zsh as default shell"

# Common apt packages
# Prefer nix packages if available, unless it's "core" package
AptInstall apt-transport-https
AptInstall git
AptInstall wget
AptInstall libssl-dev
AptInstall build-essential
AptInstall p7zip-full
# dotfile manager
AptInstall stow
AptInstall docker.io
# android tools
AptInstall android-tools-adb
AptInstall android-tools-fastboot

# We first need our dotfiles, so we can have configured paths and aliases
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


# CLI tools
#
# shell prompt
NixInstall nixpkgs.starship
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
# Vim
NixInstall nixpkgs.vim
# see what files takes space (Better ncdu)
NixInstall nixpkgs.gdu
# Htop
NixInstall nixpkgs.htop
# multiplexer
NixInstall nixpkgs.tmux
# Better cp
NixInstall nixpkgs.rsync
# Sync and encrypt with cloud providers
NixInstall nixpkgs.rclone
# rm with support for trash
NixInstall nixpkgs.trash-cli
# update all packages 
NixInstall nixpkgs.topgrade
# Cheatsheet (c version)
NixInstall nixpkgs.tldr
# Better ctrl+r
NixInstall nixpkgs.mcfly
# httpie in rust, similar as curl
NixInstall nixpkgs.xh
# better df
NixInstall nixpkgs.duf
# better tmux 
NixInstall nixpkgs.zellij
# jumper
NixInstall nixpkgs.zoxide

# Dev
#
# Deno 
NixInstall nixpkgs.deno
# docker compose
NixInstall nixpkgs.docker-compose
# github cli
NixInstall nixpkgs.gh
# Sqlite
NixInstall nixpkgs.sqlite

# Node
#
#Install volta (Node installer)
BigEcho "Installing Volta"
curl https://get.volta.sh | bash
BigEcho "Installed Volta"
# Install Node and global packages
VoltaInstall node@lts
VoltaInstall yarn
VoltaInstall pnpm
VoltaInstall typescript
VoltaInstall @nestjs/cli


#!/bin/bash


# Import echo function
. $HOME/dotfiles/machine-setup/big-echo.sh

#
# Brave Browser keys
#
BigEcho "Initializing Brave Setup"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
BigEcho "Finished Brave Setup"


# Remove .deb libre office
sudo apt purge -y libreoffice*

# Update and upgrade
sudo apt update
sudo apt upgrade

AptInstall fonts-firacode
AptInstall fonts-roboto
AptInstall fonts-font-awesome
AptInstall tilix
AptInstall alacritty
AptInstall gnome-tweaks
AptInstall brave-browser
# It's available in PopOS by default
AptInstall code
# It's available in PopOS by default
AptInstall lutris
# Drag and drop does not work in Flatpak version
AptInstall celluloid


#
# Flatpaks
#
# Spotify
FlatpakInstall com.spotify.Client
# Stremio
FlatpakInstall com.stremio.Stremio
# DBeaver
FlatpakInstall io.dbeaver.DBeaverCommunity
# Viber
FlatpakInstall com.viber.Viber
# Tor Browser
FlatpakInstall com.github.micahflee.torbrowser-launcher
# Tutanota (email)
FlatpakInstall com.tutanota.Tutanota
# Transmission (torrent)
FlatpakInstall com.transmissionbt.Transmission
# Calibre (books)
FlatpakInstall com.calibre_ebook.calibre
# Libre Office
FlatpakInstall org.libreoffice.LibreOffice
# Proton for games updater
FlatpakInstall net.davidotek.pupgui2

# Github Desktop
# FlatpakInstall io.github.shiftey.Desktop
# Postman
# FlatpakInstall com.getpostman.Postman

# changed swappines from 60 to 10
# vim /etc/sysctl.conf

dconf load / < "$HOME/dotfiles/machine-setup/manual-dconf-backup.dconf"

#!/bin/sh


#
# Brave Browser keys
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list


# Update and upgrade
sudo apt update
sudo apt upgrade

# Install fonts
sudo apt install -y fonts-firacode fonts-roboto fonts-font-awesome

# Tilix
sudo apt install -y tilix

# Gnome tweaks
sudo apt install -y gnome-tweaks

sudo apt install -y brave-browser

# It's available in PopOS by default
echo "Install Visual Studio Code"
sudo apt install -y code

sudo apt install -y celluloid
sudo apt install -y qbittorrent


# echo "Install gnome extenisions"
# echo "dash to panel, user themes, gsconnect, pop shell"


# changed swappines from 60 to 10
# vim /etc/sysctl.conf

#
# Flatpaks
#
# Spotify
flatpak install -y flathub com.spotify.Client
# Stremio
flatpak install -y flathub com.stremio.Stremio
# DBeaver
flatpak install -y flathub io.dbeaver.DBeaverCommunity
# Viber
flatpak install -y flathub com.viber.Viber
# Tor Browser
flatpak install -y flathub com.github.micahflee.torbrowser-launcher
# Github Desktop
flatpak install -y flathub io.github.shiftey.Desktop
# Postman
flatpak install -y flathub com.getpostman.Postman
# Tutanota
flatpak install -y flathub com.tutanota.Tutanota

dconf load / < ~/dotfiles/machine_setup/manual_dconf_backup.dconf

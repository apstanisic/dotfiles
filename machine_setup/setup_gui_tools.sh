#!/bin/sh


#
# Brave Browser keys
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list


# Update and upgrade
sudo apt update
sudo apt upgrade

echo "Installing fonts"
sudo apt install -y fonts-firacode fonts-roboto fonts-font-awesome

echo "Installing Tilix"
sudo apt install -y tilix

echo "Installing Gnome Tweaks"
sudo apt install -y gnome-tweaks

echo "Installing Brave Browser"
sudo apt install -y brave-browser

# It's available in PopOS by default
echo "Installing Visual Studio Code"
sudo apt install -y code

# Drag and drop does not work in Flatpak version
echo "Installing Celluloid (MPV)"
sudo apt install -y celluloid

# It's available in PopOS by default
echo "Installing Lutris"
sudo apt install -y lutris

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
# flatpak install -y flathub io.github.shiftey.Desktop
# Postman
# flatpak install -y flathub com.getpostman.Postman
# Tutanota (email)
flatpak install -y flathub com.tutanota.Tutanota
# Transmission (torrent)
flatpak install flathub com.transmissionbt.Transmission
# Calibre (books)
flatpak install flathub com.calibre_ebook.calibre


dconf load / < ~/dotfiles/machine_setup/manual_dconf_backup.dconf

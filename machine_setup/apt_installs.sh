#!/bin/sh

export DEBIAN_FRONTEND="noninteractive"

echo "Updating repositories"
sudo apt update -y & sudo apt upgrade -y
echo "Finished updating repositories"

echo "Installing apt-transport-https"
sudo apt install -y apt-transport-https
echo "Finished installing apt-transport-https"

echo "Installing zsh git vim curl wget xclip tmux htop"
sudo apt install -y zsh git vim curl wget xclip tmux htop
echo "Finished installing zsh git vim curl wget xclip tmux htop"

echo "Installing libssl-dev build-essential p7zip-full"
sudo apt install -y libssl-dev build-essential p7zip-full
echo "Finished libssl-dev build-essential p7zip-full"

echo "Installing Android drivers"
sudo apt install -y android-tools-adb android-tools-fastboot
echo "Finished installing Android drivers"

echo "Installing sqlite3"
sudo apt install -y sqlite3
echo "Finished installing sqlite3"

echo "Installing pip"
sudo apt install -y python3-pip
echo "Finished install pip"

echo "Installing neovim"
sudo apt install -y neovim
echo "Finished installing neovim"

# Install docker from ubuntu repositories
echo "Installing Docker"
sudo apt install -y docker.io docker-compose
echo "Finished installing Docker"


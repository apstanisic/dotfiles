#!/bin/sh

export DEBIAN_FRONTEND="noninteractive"

# echo "Set root password"
# sudo passwd root

# By default aliases are not enabled in non interactive shell script
shopt -s expand_aliases

#
# Packages from repositories
#
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

#
# Other installs and config
# We first need our dotfiles, so we can have configured paths and aliases
#

echo "Installing Mackup"
pip3 install --upgrade mackup
echo "Finished installing Mackup"

echo "Cloning dotfiles"
git clone https://github.com/apstanisic/dotfiles.git ~/dotfiles
echo "Finished cloning dotfiles"

echo "Make paths and aliases available in shell"
source ~/dotfiles/Mackup/.config/paths
source ~/dotfiles/Mackup/.config/aliases

echo "Initializing Mackup"
cp ~/dotfiles/Mackup/.mackup.cfg ~/.mackup.cfg
echo "Finished initializing Mackup"

echo "Restoring config"
mackup restore -f
echo "Finished restoring config"

echo "Installing Node and global packages"
# Install volta (Node installer)
curl https://get.volta.sh | bash
# Install Node
volta install node@lts
# Prettier git diff
volta install diff-so-fancy
# Global Typescript
volta install typescript
# Cheatsheet
volta install tldr
# Nest CLI
volta install @nestjs/cli
echo "Finished installing Node and global packages"


echo "Install vim-plug for neovim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing neovim plugins"
nvim -es -u ~/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"
echo "Finished installing neovim plugins"


echo "Settings zsh as default shell"
sudo chsh -s /usr/bin/zsh aleksandar
echo "Finished settings zsh as default shell"

echo "Installing Starship prompt"
# Shell alias
install_starship
echo "Finished installing Starship prompt"

echo  "Installing zim (framework for zsh)"
curl -fLo ~/.zim/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh --create-dirs
zsh ~/.zim/zimfw.zsh install
echo  "Finished installing zim"
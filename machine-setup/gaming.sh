#!/bin/bash

# Import installers
. $HOME/dotfiles/machine-setup/big-echo.sh

# It's available in PopOS by default
AptInstall lutris

# Improve performance
NixInstall nixpkgs.gamemode

# Proton for games updater
FlatpakInstall net.davidotek.pupgui2
# Configure gamepad
FlatpakInstall io.github.antimicrox.antimicrox


# dotfiles
My dotfiles

Run `install_linux_terminal_apps` to install apps for development and basic tui setup.

Run `init_config_linux` to apply config
Most of config files are stored in `configs` folder. Using GNU stow to apply them.

In `linux_gui` folder are scripts to backup gnome (dconf) settings, and manual for installing
gui apps. This manually is used for remembering all apps and steps I need to do to configure
OS.

Run `install_windows_apps.ps1` to install some common Windows apps.

## Order

First clone this repo in `~/.dotfiles`
Then run `init_linux_config`. This will apply config files 
Then run `install_linux_terminal_apps`. This will install all tools, services and apps.
And in the end go to `linux_gui`, to restore Gnome settings and read `install_linux_gui_manual`
to see which apps you want to install, and implement other settings.

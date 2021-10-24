# dotfiles
Dotfiles and some scripts that are used to setup Linux machine.
It's for Pop OS, and it assumes that some Pop repositories, and some changes.
It requires Flatpak to be installed.

## Scripts
---
First run `setup_dev_tools` then `setup_gui_tools`

### `setup_dev_tools`
All CLI programs and tools. Anything that does not require GUI.

### `setup_gui_tools`
This are things that are only applicable for desktop. Fonts, GUI apps, browser, IDE, flatpaks.
It will also restore previous GNOME config backup with keyboard shortcuts, Tilix config, extensions settings...

## dotfiles
---
Minimal dotfiles for apps that I use. It's as simple as possible. It uses Mackup for backup/restore.

## dconf settings
Gnome and some apps don't use dotfiles, they use dconf. I created a dconf dump
with `dconf dump / > dconf_backup.dconf`, and then manually went and copied
relevant settings to `manual_dconf_backup.dconf`. This only copied relevant info, 
and that is not specific to this machine. It's portable when I switch to other device. It's also easier to see what settings are backed up, and it does not contain generated contents (notification, app drawer content...).

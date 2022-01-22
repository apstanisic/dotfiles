# dotfiles

Dotfiles and some scripts that are used to setup Linux machine.
It's for Pop OS, and it assumes that some Pop repositories, and some changes.
It requires Flatpak to be installed.

## Installation

To bootstrap machine, run

```bash
sudo apt install git
git clone --branch main https://github.com/apstanisic/dotfiles.git ~/dotfiles
bash ~/dotfiles/machine-setup/init-all.sh
```

## Scripts

---

### `run-all`

Run all scripts

### `setup-dev-tools`

All CLI programs and tools. Anything that does not require GUI.

### `setup-ssh`

Sets up SSH

### `sync-dotfiles`

Sync dotfiles with GNU Stow

### `setup-gui-tools`

This are things that are only applicable for desktop. Fonts, GUI apps, browser, IDE, flatpaks.
It will also restore previous GNOME config backup with keyboard shortcuts, Tilix config, extensions settings...

## dotfiles

---

Minimal dotfiles for apps that I use. It's as simple as possible. It uses GNU Stow for syncing

## dconf settings

---

Gnome and some apps don't use dotfiles, they use dconf. I created a dconf dump
with `dconf dump / > dconf_backup.dconf`, and then manually went and copied
relevant settings to `manual-dconf-backup.dconf`. This only copied relevant info,
and that is not specific to this machine. It's portable when I switch to other device. It's also easier to see what settings are backed up, and it does not contain generated contents (notification, app drawer content...).

## Gaming

Make sure to properly mount hard drive to work with Proton and Wine. [Docs here](https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows)

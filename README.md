# dotfiles

Dotfiles and some scripts that are used to setup Linux machine.
It's for Pop OS, and it assumes that some Pop repositories, and some changes.
It requires Flatpak to be installed.

## Installation

To bootstrap machine, run

```bash
curl -fsSL  https://raw.githubusercontent.com/apstanisic/dotfiles/main/machine-setup/install-all.sh | sh
```

## Scripts

---

First run `setup-dev-tools` then `setup-gui-tools`

### `setup-dev-tools`

All CLI programs and tools. Anything that does not require GUI.

### `setup-gui-tools`

This are things that are only applicable for desktop. Fonts, GUI apps, browser, IDE, flatpaks.
It will also restore previous GNOME config backup with keyboard shortcuts, Tilix config, extensions settings...

## dotfiles

---

Minimal dotfiles for apps that I use. It's as simple as possible. It uses GNU Stow for syncing

## dconf settings

Gnome and some apps don't use dotfiles, they use dconf. I created a dconf dump
with `dconf dump / > dconf_backup.dconf`, and then manually went and copied
relevant settings to `manual-dconf-backup.dconf`. This only copied relevant info,
and that is not specific to this machine. It's portable when I switch to other device. It's also easier to see what settings are backed up, and it does not contain generated contents (notification, app drawer content...).

# Arch Linux Hyprland Dotfiles

My personal Linux dotfiles for setup of Hyprland Window Manager and Gnome Desktop Environment on Arch Linux.

## Pre requisites

Distribution must be Arch Linux, not intended for others (not even Arch based Distributions)

Installed packages:

- git
- sof-firmware (Sound drivers - Optional)
- vim/ neovim/ nano (To make any changes if needed - Optional)

## How to Install

Connect to the Internet

Clone the git repo to ~ or $HOME:

```
cd ~
git clone https://github.com/Sain-Biswas/.dotfiles.git
```

Path must be $HOME as all scripts are dependent on it.

Go to .dotfiles directory

```
cd ~/.dotfiles
```

Execute the install script

```
./install.sh
```

## Changes done by the Install Script

### Installed Packages

AUR helper - paru

All Packages installed are listed in - `packages.lst`
Packages can be added or removed from above file.

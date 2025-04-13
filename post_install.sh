#!/usr/bin/env bash

# Setup Pywalfox
pywalfox install

# Setup Spicetify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

spicetify

spicetify backup apply
spicetify apply

# Select Wallpaper for proper colour scheme
~/.dotfiles/scripts/wall-selector.sh

# Set BIOS clock in local time to fix dual boot problem
timedatectl set-local-rtc 1 --adjust-system-clock

# Set all directories as git safe directory
git config --global --add safe.directory "*"

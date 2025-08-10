#!/bin/env bash

# ░█░█░█▀█░█░░░█░░░░░█▀█░█▀█░█▀█░█░░░█░█
# ░█▄█░█▀█░█░░░█░░░░░█▀█░█▀▀░█▀▀░█░░░░█░
# ░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀░░░▀░░░▀▀▀░░▀░

# Check if the user provided an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-image>"
    exit 1
fi

IMAGE="$1"

# Notify user : Changing
notify-send "Changing Theme" "Applying new wallpaper and updating colors, please wait until confirmation..."

# Set wallpaper
swww img "$IMAGE" --transition-type="center"

# Generate pywal 16 colors
wal --cols16 -i "$IMAGE"

# Apply matugen Theme
matugen image "$IMAGE"

# Update pywal colors to ghostty
cat ~/.cache/wal/ghostty.conf > ~/.dotfiles/.config/ghostty/themes/pywal
cat ~/.cache/wal/colors-alacritty.toml > ~/.dotfiles/.config/alacritty/themes/pywal.toml

# Update pywal colors to warp terminal
# mkdir -p ~/.local/share/warp-terminal/themes/
# cat ~/.cache/wal/colors-warp-terminal.yml > ~/.local/share/warp-terminal/themes/pywal_16.yml

# Generate Telegram Theme
wal-telegram --wal

# Notify user : Changed Successfully
notify-send "Theme Applied" "Wallpaper and Theme applied seccessfully!"

#!/usr/bin/bash

sudo pacman -Syyu stow rust

cd ~/.config

rm -rf hypr kitty

cd ~/.dotfiles
stow .

cd ~

mkdir Github .icons .themes
cd Github

git clone https://aur.archlinux.org/paru-git.git
cd paru-git
makepkg -si
cd src/paru
cargo clean

sudo pacman-key -r "linux-maintainers@warp.dev"
sudo pacman-key --lsign-key "linux-maintainers@warp.dev"
sudo sh -c "echo -e '\n[warpdotdev]\nServer = https://releases.warp.dev/linux/pacman/\$repo/\$arch' >> /etc/pacman.conf"

sudo pacman -Syy

cd ~/.dotfiles

paru -Rcns dolphin vim nano htop wofi polkit-kde-agent

paru -Syy --needed chaotic-aur/android-studio bat chaotic-aur/brave-bin brightnessctl chromium clang cliphist dunst eslint fastfetch fzf gdb gnome-disk-utility go chaotic-aur/google-chrome grim chaotic-aur/grimblast-git hypridle hyprlock hyprpaper hyprpicker intellij-idea-community-edition kitty lldb loupe chaotic-aur/mongodb-compass nautilus neovim noto-fonts-emoji ntfs-3g nwg-look pavucontrol polkit-gnome chaotic-aur/profile-sync-daemon-brave python-pip python-pywal16 rofi-wayland rust rust-analyzer stow ttf-font-awesome unzip chaotic-aur/visual-studio-code-bin warp-terminal waybar xdg-user-dirs xorg-xwayland zed zoxide zsh

xdg-user-dirs-update

cd ~

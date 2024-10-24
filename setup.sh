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

cd ~/Github
git clone --depth=1 https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh -t grey -c dark -s compact -i arch -l --tweaks primary macos submenu dock

cd ~/.dotfiles

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sh -c "echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf"
sudo pacman -Syy

sudo pacman-key -r "linux-maintainers@warp.dev"
sudo pacman-key --lsign-key "linux-maintainers@warp.dev"
sudo sh -c "echo -e '\n[warpdotdev]\nServer = https://releases.warp.dev/linux/pacman/\$repo/\$arch' >> /etc/pacman.conf"

sudo pacman -Syy

cd ~/.dotfiles

paru -Rcns vim nano htop wofi dolphin qt5-wayland qt6-wayland polkit-kde-agent sassc

paru -Syy --needed chaotic-aur/android-studio bat chaotic-aur/brave-bin brightnessctl chromium clang cliphist dunst eslint eza fastfetch fzf gdb gnome-disk-utility go chaotic-aur/google-chrome grim chaotic-aur/grimblast-git hypridle hyprlock hyprpaper hyprpicker intellij-idea-community-edition kitty lldb loupe chaotic-aur/mongodb-compass neovim noto-fonts-emoji ntfs-3g nwg-look pavucontrol chaotic-aur/profile-sync-daemon-brave python-pip python-pywal16 rofi-wayland rust rust-analyzer stow ttf-font-awesome unzip chaotic-aur/visual-studio-code-bin warp-terminal waybar xdg-user-dirs xorg-xwayland zed zoxide zsh gtk2 noto-fonts-cjk noto-fonts-extra gnome-terminal nautilus polkit-gnome gnome-keyring chaotic-aur/postman-bin zen-browser-avx2-bin docker docker-desktop firefox-developer-edition

xdg-user-dirs-update

cd ~

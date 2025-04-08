#!/usr/bin/env bash

# Update all packages
sudo pacman -Syyu

# Install rust for paru
cd ~
sudo pacman -S --needed rust

# Make Needed Folders
mkdir -p .config Github
cd .config
touch hello.txt

# Creating symlinks for dotfiles
cd ~/.dotfiles
stow .

# Remove unwanted files
cd ~/.config
rm hello.txt

# Install aur helper
cd ~/Github
git clone https://aur.archlinux.org/paru-git.git
cd paru-git
makepkg -si
cd src/paru
cargo clean

# Add warp terminal repo to pacman
sudo sh -c "echo -e '\n[warpdotdev]\nServer = https://releases.warp.dev/linux/pacman/\$repo/\$arch' >> /etc/pacman.conf"
sudo pacman-key -r "linux-maintainers@warp.dev"
sudo pacman-key --lsign-key "linux-maintainers@warp.dev"
sudo pacman -Syyu

# Install Packages
cd ~
paru -Syy --needed $(grep -v '^#' packages.lst | tr '\n' ' ')

# Install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node

# Install bun js
curl -fsSL https://bun.sh/install | sh

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Change default shell to zsh
chsh -s /usr/bin/zsh

# Cache clean up
paru -Sccc

# Setup sddm
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# Start Hyprland
Hyprland

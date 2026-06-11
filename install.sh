#!/bin/bash

set -e

if [[ $UID -eq 0 ]]; then
    echo "ERROR: This script should not be run with sudo, or as root."
    exit 1
fi

echo Installing required packages...
sudo pacman -S --needed --noconfirm \
    base-devel git \
    pipewire pipewire-pulse pipewire-alsa wireplumber \
    networkmanager \
    greetd greetd-tuigreet \
    hyprland hyprpaper kitty nvim rofi uwsm \
    wl-clipboard grim slurp podman \
    otf-font-awesome lsd \
    gnome-themes-extra brightnessctl \
    xdg-desktop-portal-hyprland xorg-xwayland \
    ripgrep playerctl jq \
    noto-fonts noto-fonts-emoji ttf-dejavu

echo Installing yay if needed...
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    pushd yay
    makepkg -si
    popd
fi

echo Installing required packages with yay...
yay -S --needed --noconfirm eww gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git

echo Symlinking configuration files...
sudo ./home/.local/bin/lnr ./etc/ /etc/
./home/.local/bin/lnr ./home $HOME

echo Enable systemd services...
sudo systemctl enable NetworkManager
sudo systemctl enable greetd

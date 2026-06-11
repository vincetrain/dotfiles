#!/bin/bash

set -e

echo Installing required packages
pacman -S --needed --noconfirm \
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

echo Installing yay if needed
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    pushd yay
    makepkg -si
    popd
fi

echo Installing required packages with yay
yay -S --needed --noconfirm eww gnome-themes-extra-gtk2 adwaita-qt5-git adwaita-qt6-git

echo Copying configuration files
cp -r ./etc/ /etc/
cp -r ./home $HOME

echo Enable systemd services
systemctl enable NetworkManager
systemctl enable greetd

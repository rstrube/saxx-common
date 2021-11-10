#!/bin/bash
#|./ingredients/core/aur.sh #Mandatory AUR helper

sudo pacman -S --noconfirm --needed rust

CWD=$(pwd)

mkdir -p ~/.paru-makepkg
git clone https://aur.archlinux.org/paru.git ~/.paru-makepkg/paru
cd ~/.paru-makepkg/paru
makepkg -si --noconfirm --needed

cd ${CWD}
rm -rf ~/.paru-makepkg

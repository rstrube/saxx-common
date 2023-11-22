#!/bin/bash
#|./ingredients/core/flatpak.sh #Flatpak and important flatpak utilities

sudo pacman -S --noconfirm --needed flatpak

flatpak install flathub com.github.tchx84.Flatseal

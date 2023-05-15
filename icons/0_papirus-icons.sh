#!/bin/bash
#|#./ingredients/icons/0_papirus-icons.sh #Papirus icon theme

paru -S --noconfirm --needed papirus-icon-theme

# Gnome
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
    echo "Configuring Papirus icons for Gnome"

    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
fi

# KDE
if [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]]; then
    echo "Configuring Papirus icons for KDE"

    /usr/lib/plasma-changeicons "Papirus-Dark"
fi

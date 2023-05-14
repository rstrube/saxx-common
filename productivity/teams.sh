#!/bin/bash
#|#./ingredients/productivity/teams.sh #Teams for Linux (uses electron wrapper)

paru -S --noconfirm --needed teams-for-linux

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ~/.local/share/applications/teams-for-linux.desktop"

    # Copy the system .desktop file to your $HOME and tweak it to launch teams-for-linux as a native Wayland application
    if [[ ! -d "~/.local/share/applications" ]]; then
        mkdir -p ~/.local/share/applications
    fi

    cp /usr/share/applications/teams-for-linux.desktop ~/.local/share/applications/.
    sed -i 's/Exec=teams-for-linux/& --enable-webrtc-pipewire-capturer --ozone-platform-hint=auto/' ~/.local/share/applications/teams-for-linux.desktop
fi

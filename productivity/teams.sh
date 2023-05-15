#!/bin/bash
#|#./ingredients/productivity/teams.sh #Teams for Linux (uses electron wrapper)

paru -S --noconfirm --needed teams-for-linux

LOCAL_APPLICATIONS_DIR=~/.local/share/applications
USR_APPLICATIONS_DIR=/usr/share/applications
TEAMS_DESKTOP_FILE=teams-for-linux.desktop

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ${LOCAL_APPLICATIONS_DIR}/${TEAMS_DESKTOP_FILE}"

    # Copy the system .desktop file to your $HOME and tweak it to launch teams-for-linux as a native Wayland application
    if [[ ! -d "$LOCAL_APPLICATIONS_DIR" ]]; then
        mkdir -p $LOCAL_APPLICATIONS_DIR
    fi

    cp ${USR_APPLICATIONS_DIR}/${TEAMS_DESKTOP_FILE} ${LOCAL_APPLICATIONS_DIR}/.
    sed -i 's/Exec=teams-for-linux/& --enable-webrtc-pipewire-capturer --ozone-platform-hint=auto/' ${LOCAL_APPLICATIONS_DIR}/${TEAMS_DESKTOP_FILE}
fi

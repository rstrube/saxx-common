#!/bin/bash
#|#./ingredients/system/kde-remove-sddm.sh #Remove SDDM display manager and support starting plasma directly after logging in on TTY1

# Disable the SDDM systemd service
sudo systemctl disable sddm.service

# Remove all traces of SDDM
paru -Rns sddm sddm-kcm

BASH_PROFILE=~/.bash_profile
FISH_CONFIG_DIR=~/.config/fish/conf.d
TTY1_PLASMA_START_FISH_FILE=tty1-plasma-start.fish
PAM_LOGIN_FILE=/etc/pam.d/login

# Append to .bash_profile in order to start KDE plasma when logging into to TTY1
echo "Appending to ${BASH_PROFILE} to support starting plasma after login on TTY1"

echo "" >> $BASH_PROFILE
echo "# If running from tty1 start kde plasma" >> $BASH_PROFILE
echo '[ "$(tty)" = "/dev/tty1" ] && exec startplasma-wayland' >> $BASH_PROFILE

# If using fish, setup a .fish file to start KDE plasma with logging into TTY1
if [[ -e /usr/bin/fish ]]; then

    echo "fish shell detected, creating ${FISH_CONFIG_DIR}/${TTY1_PLASMA_START_FISH_FILE} to support starting plasma after login on TTY1"

    cat <<EOT > ${TTY1_PLASMA_START_FISH_FILE}
# If running from tty1 start kde plasma
set TTY1 (tty)
[ "\$TTY1" = "/dev/tty1" ] && exec startplasma-wayland
EOT

    mv $TTY1_PLASMA_START_FISH_FILE $FISH_CONFIG_DIR
fi

echo "Configuring kwallet to unlock when logging in via TTY1"

echo "auth       optional     pam_kwallet5.so" | sudo tee -a $PAM_LOGIN_FILE
echo "session    optional     pam_kwallet5.so auto_start force_run" | sudo tee -a $PAM_LOGIN_FILE

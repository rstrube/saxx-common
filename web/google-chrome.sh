#!/bin/bash
#|#./ingredients/web/google-chrome.sh #Google Chrome

paru -S --noconfirm --needed google-chrome

CONFIG_DIR=~/.config
CHROME_FLAGS=chrome-flags.conf

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ${CONFIG_DIR}/${CHROME_FLAGS}"
    
    if [[ ! -d "$CONFIG_DIR" ]]; then
        mkdir -p $CONFIG_DIR
    fi

    cat <<EOT > ${CHROME_FLAGS}
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT

    cp $CHROME_FLAGS $CONFIG_DIR
    rm $CHROME_FLAGS
fi

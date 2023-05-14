#!/bin/bash
#|#./ingredients/web/google-chrome.sh #Google Chrome

paru -S --noconfirm --needed google-chrome

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ~/.config/chrome-flags.conf"
    
    if [[ ! -d "~./config" ]]; then
        mkdir -p ~/.config
    fi

cat <<EOT > "chrome-flags.conf"	
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT

    cp chrome-flags.conf ~/.config/
    rm chrome-flags.conf
fi

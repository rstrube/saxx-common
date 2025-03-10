#!/bin/bash
#|#./ingredients/fonts/jetbrains-mono.sh #Install and configure JetBrainsMono Nerd Font

# 2025-03-09
# ==========
# * Leverage new arch extras package ttf-jetbrains-mono-nerd which makes things way easier :)

DIR=$(dirname "$0")
source $DIR/_helper/vscode-font-functions.sh

VSCODE=/usr/bin/code

paru -S --noconfirm --needed ttf-jetbrains-mono-nerd

# This rebuilds the font-cache, taking into account any changes
sudo fc-cache -r -v
fc-cache -r -v

# Note: you can list fonts using fc-list 

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Configuring JetBrainsMono Nerd Font for vscode"
    configure_vscode_font "JetBrainsMono Nerd Font" "500"
fi

# Test font coverage for specific unicode characters required by PowerLine
echo "Testing font coverage..."
echo -e "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \u2800 \u28ff \u25a0 \u25ff \u2500 \u259f"

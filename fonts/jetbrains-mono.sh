#!/bin/bash
#|#./ingredients/fonts/jetbrains-mono.sh #Install and configure Jetbrains Mono font

ETC_FONT_CONFIG_DIR=/etc/fonts/conf.d
LOCAL_FONT_CONFIG_DIR=~/.config/fontconfig
FONT_CONFIG_FILE=fonts.conf

DIR=$(dirname "$0")
source $DIR/jetbrains-mono/jetbrains-mono-kitty.sh
source $DIR/jetbrains-mono/jetbrains-mono-vscode.sh

KITTY=/usr/bin/kitty
VSCODE=/usr/bin/code

# Install the following fonts:
# Jetbrains Mono: a fantastic monospace font
# Nerd Fonts: Provides a plethora of font icons
paru -S --noconfirm --needed ttf-jetbrains-mono ttf-nerd-fonts-symbols

# Create a symlink for the nerd fonts config
sudo ln -s /usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf $ETC_FONT_CONFIG_DIR

# Create fonts.conf in $HOME to register JetBrains as a monospace font
if [[ ! -d "$LOCAL_FONT_CONFIG_DIR" ]]; then
    mkdir -p $LOCAL_FONT_CONFIG_DIR
fi

cat <<EOT > ${FONT_CONFIG_FILE}
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- set JetBrains Mono as the preferred monospace font (fallback to Nerd Font for missing glyphs) -->
    <alias>
        <family>monospace</family>
        <prefer>
            <family>JetBrains Mono</family>
            <family>Symbols Nerd Font</family>
        </prefer>
    </alias>
    <dir>~/.fonts</dir>
</fontconfig>
EOT

mv $FONT_CONFIG_FILE $LOCAL_FONT_CONFIG_DIR

# This rebuilds the font-cache, taking into account any changes
sudo fc-cache -r -v
fc-cache -r -v

# Confirm that Jetbrains Mono is the default font used for monospace
fc-match --verbose monospace

# Gnome
if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
    echo "Configuring Jetbrains Mono font for Gnome"

    gsettings set org.gnome.desktop.interface font-name "Noto Sans 10"
    gsettings set org.gnome.desktop.interface document-font-name "Noto Sans 10"
    gsettings set org.gnome.desktop.interface monospace-font-name "JetBrains Mono 11"
    gsettings set org.gnome.desktop.wm.preferences titlebar-font "Noto Sans Medium 10"
fi

# KDE
if [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]]; then
    echo "Configuring Jetbrains Mono font for KDE"

    # Set the default fixed with font for KDE to JetBrains Mono 11pt
    kwriteconfig5 --group General --key fixed "JetBrains Mono,11,-1,5,50,0,0,0,0,0"
fi

# kitty
if [[ -e "$KITTY" ]]; then
    echo "Configuring Jetbrains Mono font for kitty"

    init_jetbrains_mono_kitty
    configure_jetbrains_mono_kitty
fi

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Configuring Jetbrains Mono font for vscode"

    configure_jetbrains_mono_vscode
fi

# Test font coverage for specific unicode characters required by PowerLine
echo "Testing font coverage..."
echo -e "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \u2800 \u28ff \u25a0 \u25ff \u2500 \u259f"

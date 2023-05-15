#!/bin/bash
#|#./ingredients/dev/1_vscode.sh #Visual Studio Code

CONFIG_DIR=~/.config
CODE_FLAGS=code-flags.conf
VSCODE_SETTINGS_DIR_PATH="${CONFIG_DIR}/Code/User"
VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

paru -S --noconfirm --needed visual-studio-code-bin

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ~/.config/code-flags.conf"
    
    if [[ ! -d "$CONFIG_DIR" ]]; then
        mkdir -p $CONFIG_DIR
    fi

    if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
        echo "Gnome detected, adding --enable-features=WaylandWindowDecorations"

        cat <<EOT > ${CODE_FLAGS}
--enable-features=WaylandWindowDecorations
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT
    else
        cat <<EOT > ${CODE_FLAGS}
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT
    fi

    cp $CODE_FLAGS $CONFIG_DIR
    rm $CODE_FLAGS
fi

if [[ ! -d "$VSCODE_SETTINGS_DIR_PATH" ]]; then
        mkdir -p "$VSCODE_SETTINGS_DIR_PATH"
fi

if [[ ! -e "$VSCODE_SETTINGS_FILE_PATH" ]]; then
    echo "Creating an empty $VSCODE_SETTINGS_FILE_PATH file"

    echo "{" > "$VSCODE_SETTINGS_FILE_PATH"
    echo "}" >> "$VSCODE_SETTINGS_FILE_PATH"
fi

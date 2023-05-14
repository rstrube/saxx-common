#!/bin/bash
#|#./ingredients/dev/1_vscode.sh #Visual Studio Code

paru -S --noconfirm --needed visual-studio-code-bin

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, creating ~/.config/code-flags.conf"
    
    if [[ ! -d "~./config" ]]; then
        mkdir -p ~/.config
    fi

    if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
        echo "Gnome detected, adding --enable-features=WaylandWindowDecorations"

        cat <<EOT > "code-flags.conf"
--enable-features=WaylandWindowDecorations
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT
    else
        cat <<EOT > "code-flags.conf"
--enable-webrtc-pipewire-capturer
--ozone-platform-hint=auto
EOT
    fi

    cp code-flags.conf ~/.config/
    rm code-flags.conf
fi

VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

if [[ ! -d "$VSCODE_SETTINGS_DIR_PATH" ]]; then
        mkdir -p "$VSCODE_SETTINGS_DIR_PATH"
fi

if [[ ! -e "$VSCODE_SETTINGS_FILE_PATH" ]]; then
    echo "Creating an empty $VSCODE_SETTINGS_FILE_PATH file"

    echo "{" > "$VSCODE_SETTINGS_FILE_PATH"
    echo "}" >> "$VSCODE_SETTINGS_FILE_PATH"
fi

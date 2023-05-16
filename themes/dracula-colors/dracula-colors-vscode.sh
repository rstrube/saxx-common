#!/bin/bash

function configure_dracula_colors_vscode {

    local VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
    local VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

    code --install-extension dracula-theme.theme-dracula
    sed -i '$i\    "workbench.colorTheme": "Dracula",' "$VSCODE_SETTINGS_FILE_PATH"
}

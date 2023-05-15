#!/bin/bash

function configure_jetbrains_mono_vscode {

    local VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
    local VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

    sed -i '$i\    "editor.fontFamily": "JetBrains Mono",' "$VSCODE_SETTINGS_FILE_PATH"
    sed -i '$i\    "editor.fontWeight": "500",' "$VSCODE_SETTINGS_FILE_PATH"
    sed -i '$i\    "editor.fontLigatures": true,' "$VSCODE_SETTINGS_FILE_PATH"
}

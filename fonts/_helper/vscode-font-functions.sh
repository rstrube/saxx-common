#!/bin/bash

function configure_vscode_font {

    if [[ "$#" -ne 2 ]]; then
        echo "Error: configure_vscode_font must be run with two arguments"
        echo ""
        exit 1
    fi

    local FONT_NAME=$1
    local FONT_WEIGHT=$2

    echo "Settings vcode font to $FONT_NAME with weight $FONT_WEIGHT"

    local VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
    local VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

    sed -i '$i\    "editor.fontFamily": "'"$FONT_NAME"'",' "$VSCODE_SETTINGS_FILE_PATH"
    sed -i '$i\    "editor.fontWeight": "'"$FONT_WEIGHT"'",' "$VSCODE_SETTINGS_FILE_PATH"
    sed -i '$i\    "editor.fontLigatures": true,' "$VSCODE_SETTINGS_FILE_PATH"
}

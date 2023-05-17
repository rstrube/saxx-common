#!/bin/bash
#|#./ingredients/dev/vscode-vim.sh #vim extension for VSCode [Requires /dev/1_vscode ingredient]

code --install-extension vscodevim.vim

echo "Configuring VSCodeVim to use system clipboard for unnamed register"

VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

sed -i '$i\    "vim.useSystemClipboard": true,' "$VSCODE_SETTINGS_FILE_PATH"

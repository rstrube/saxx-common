#!/bin/bash
#|#./ingredients/themes/dracula-colors.sh #Dracula colors terminal, IDEs

DIR=$(dirname "$0")
source $DIR/dracula-colors/dracula-colors-fish.sh
source $DIR/dracula-colors/dracula-colors-vscode.sh

FISH=/usr/bin/fish
VSCODE=/usr/bin/code

# fish
if [[ -e "$FISH" ]]; then
    echo "Configuring Dracula colors for fish"

    configure_dracula_colors_fish_tty
    configure_dracula_colors_fish
fi

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Configuring Dracula colors for vscode"

    configure_dracula_colors_vscode
fi
#!/bin/bash
#|#./ingredients/themes/dracula-colors.sh #Dracula colors for fish, kitty, and vscode

DIR=$(dirname "$0")
source $DIR/dracula-colors/dracula-colors-fish.sh
source $DIR/dracula-colors/dracula-colors-kitty.sh
source $DIR/dracula-colors/dracula-colors-vscode.sh

FISH=/usr/bin/fish
KITTY=/usr/bin/kitty
VSCODE=/usr/bin/code

# fish
if [[ -e "$FISH" ]]; then
    echo "Configuring Dracula colors for fish"

    configure_dracula_colors_fish_tty
    configure_dracula_colors_fish
fi

# kitty
if [[ -e "$KITTY" ]]; then
    echo "Configuring Dracula colors for kitty"

    configure_dracula_colors_kitty
fi

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Configuring Dracula colors for vscode"

    configure_dracula_colors_vscode
fi
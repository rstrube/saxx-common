#!/bin/bash
#|#./ingredients/themes/dracula-theme.sh #Dracula theme

DIR=$(dirname "$0")
source $DIR/dracula/dracula-theme-fish.sh
source $DIR/dracula/dracula-theme-kitty.sh
source $DIR/dracula/dracula-theme-vscode.sh

FISH=/usr/bin/fish
KITTY=/usr/bin/kitty
VSCODE=/usr/bin/code

# fish
if [[ -e "$FISH" ]]; then
    echo "Configuring Dracula theme for fish"

    configure_dracula_fish_tty_colors
    configure_dracula_fish_colors
fi

# kitty
if [[ -e "$KITTY" ]]; then
    echo "Configuring Dracula theme for kitty"

    configure_dracula_kitty
fi

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Configuring Dracula theme for vscode"

    configure_dracula_vscode
fi
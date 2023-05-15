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
    echo "Setting up dracula theme for fish"

    init_dracula_fish
    configure_dracula_fish_tty_colors
    configure_dracula_fish_colors
fi

# kitty
if [[ -e "$KITTY" ]]; then
    echo "Setting up dracula theme for kitty"

    init_dracula_kitty
    configure_dracula_kitty
fi

# vscode
if [[ -e "$VSCODE" ]]; then
    echo "Setting up dracula theme for vscode"

    configure_dracula_vscode
fi
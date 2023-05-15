#!/bin/bash
#|#./ingredients/themes/dracula-theme.sh #Dracula theme

DIR=$(dirname "$0")
source $DIR/dracula/dracula-theme-fish.sh
source $DIR/dracula/dracula-theme-kitty.sh
source $DIR/dracula/dracula-theme-vscode.sh

# fish
if [[ -e "/usr/bin/fish" ]]; then
    echo "Setting up draclua theme for fish"

    init_dracula_fish
    configure_dracula_fish_tty_colors
    configure_dracula_fish_colors
fi

# kitty
if [[ -e "/usr/bin/kitty" ]]; then
    echo "Setting up draclua theme for kitty"

    init_dracula_kitty
    configure_dracula_kitty
fi

# vscode
if [[ -e "/usr/bin/code" ]]; then
    echo "Setting up draclua theme for vscode"

    configure_dracula_vscode
fi
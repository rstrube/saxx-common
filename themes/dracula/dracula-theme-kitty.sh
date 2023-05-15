#!/bin/bash

KITTY_CONFIG_DIR=~/.config/kitty
KITTY_CONFIG_FILE=kitty.conf
KITTY_CONFIG_FILE_FULL_PATH=${KITTY_CONFIG_DIR}/${KITTY_CONFIG_FILE}

DRACULA_COLORS_CONFIG_FILE=dracula-colors.conf

function configure_dracula_kitty {

    if [[ ! -d "$KITTY_CONFIG_DIR" ]]; then
        mkdir -p $KITTY_CONFIG_DIR
    fi

    cat <<EOT > ${DRACULA_COLORS_CONFIG_FILE}
# vim:ft=kitty
## name: Dracula
## author: Keegan Carruthers-Smith
## license: MIT
## upstream: https://raw.githubusercontent.com/dracula/kitty/master/dracula.conf

foreground            #f8f8f2
background            #282a36
selection_foreground  #ffffff
selection_background  #44475a
url_color #8be9fd
color0  #21222c
color8  #6272a4
color1  #ff5555
color9  #ff6e6e
color2  #50fa7b
color10 #69ff94
color3  #f1fa8c
color11 #ffffa5
color4  #bd93f9
color12 #d6acff
color5  #ff79c6
color13 #ff92df
color6  #8be9fd
color14 #a4ffff
color7  #f8f8f2
color15 #ffffff
cursor            #f8f8f2
cursor_text_color background
active_tab_foreground   #282a36
active_tab_background   #f8f8f2
inactive_tab_foreground #282a36
inactive_tab_background #6272a4
mark1_foreground #282a36
mark1_background #ff5555
EOT

    mv $DRACULA_COLORS_CONFIG_FILE $KITTY_CONFIG_DIR

    echo "# BEGIN_KITTY_THEME" >> ${KITTY_CONFIG_FILE_FULL_PATH}
    echo "# Dracula Theme" >> ${KITTY_CONFIG_FILE_FULL_PATH}
    echo "include dracula-colors.conf" >> ${KITTY_CONFIG_FILE_FULL_PATH}
    echo "# END_KITTY_THEME" >> ${KITTY_CONFIG_FILE_FULL_PATH}
}

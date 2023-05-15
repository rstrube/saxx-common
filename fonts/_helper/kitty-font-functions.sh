#!/bin/bash

KITTY_CONFIG_DIR=~/.config/kitty
KITTY_CONFIG_FILE=kitty.conf
KITTY_CONFIG_FILE_FULL_PATH=${KITTY_CONFIG_DIR}/${KITTY_CONFIG_FILE}

function configure_kitty_font {

    if [[ "$#" -ne 2 ]]; then
        echo "Error: configure_kitty_font() must be run with two arguments"
        echo ""
        exit 1
    fi

    if [[ ! -d "$KITTY_CONFIG_DIR" ]]; then
        mkdir -p $KITTY_CONFIG_DIR
    fi

    local FONT_NAME=$1
    local FONT_SIZE=$2

    echo "Settings kitty font to $FONT_NAME with size $FONT_SIZE"
    
    echo "font_family       ${FONT_NAME}" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "bold_font         auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "italic_font       auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "bold_italic_font  auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "font_size         ${FONT_SIZE}" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "" >> $KITTY_CONFIG_FILE_FULL_PATH
}

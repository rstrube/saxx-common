#!/bin/bash

KITTY_CONFIG_DIR=~/.config/kitty
KITTY_CONFIG_FILE=kitty.conf
KITTY_CONFIG_FILE_FULL_PATH=${KITTY_CONFIG_DIR}/${KITTY_CONFIG_FILE}

function init_jetbrains_mono_kitty() {

    if [[ ! -d "$KITTY_CONFIG_DIR" ]]; then
        mkdir -p $KITTY_CONFIG_DIR
    fi
}

function configure_jetbrains_mono_kitty {

    echo "font_family       JetBrains Mono" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "bold_font         auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "italic_font       auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "bold_italic_font  auto" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "font_size         12.0" >> $KITTY_CONFIG_FILE_FULL_PATH
    echo "" >> $KITTY_CONFIG_FILE_FULL_PATH
}

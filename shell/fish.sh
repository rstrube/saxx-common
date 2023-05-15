#!/bin/bash
#|#./ingredients/shell/fish.sh #Fish shell

DIR=$(dirname "$0")
source $DIR/../_helper/_common-functions.sh

FISH_CONFIG_DIR=~/.config/fish/conf.d
ALIASES_FISH_FILE=aliases.fish
PWD_LENGTH_FISH_FILE=pwd-length.fish

function main() {

    install
}

function install() {

    paru -S --noconfirm --needed fish
    
    if [[ ! -d "$FISH_CONFIG_DIR" ]]; then
        mkdir -p $FISH_CONFIG_DIR
    fi

    configure_fish_aliases
    configure_fish_pwd_length

    # Change the shell to fish
    chsh -s /usr/bin/fish

    echo -e "${YELLOW}Warning: you will need logout in order for the shell change to take effect.${NC}"
}

function configure_fish_aliases() {

    cat <<EOT > ${ALIASES_FISH_FILE}
alias ll="ls -la"
alias l.="ls -d .*"
alias pacman_remove_orphans="paru -c"
EOT

    cp $ALIASES_FISH_FILE ${FISH_CONFIG_DIR}/.
    rm $ALIASES_FISH_FILE
}

function configure_fish_pwd_length() {

    cat <<EOT > ${PWD_LENGTH_FISH_FILE}
# Don't shorten the working directory in the prompt
set -g fish_prompt_pwd_dir_length 0

EOT

    cp $PWD_LENGTH_FISH_FILE ${FISH_CONFIG_DIR}/.
    rm $PWD_LENGTH_FISH_FILE
}

main "$@"

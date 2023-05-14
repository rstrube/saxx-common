#!/bin/bash
# VSCode Helper Functions

VSCODE_SETTINGS_DIR_PATH="${HOME}/.config/Code/User"
VSCODE_SETTINGS_FILE_PATH="${VSCODE_SETTINGS_DIR_PATH}/settings.json"

function create_empty_vscode_settings_if_neccessary {

    
}

function update_code_desktop_file_for_wayland {

    # Copy the system .desktop file to your $HOME and tweak it to launch VSCode as a native Wayland application
    if [[ ! -d "~/.local/share/applications" ]]; then
        mkdir -p ~/.local/share/applications
    fi

    cp /usr/share/applications/visual-studio-code.desktop ~/.local/share/applications/.
    sed -i 's/\/usr\/bin\/code/& --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland/' ~/.local/share/applications/visual-studio-code.desktop
}

function create_and_configure_code_flags_for_wayland {

    if [[ ! -d "~./config" ]]; then
        mkdir -p ~/.config
    fi

    cat <<EOT > "code-flags.conf"	
--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer
--ozone-platform=wayland
EOT

    cp code-flags.conf ~/.config/
    rm code-flags.conf
}

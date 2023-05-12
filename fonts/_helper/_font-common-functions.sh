#!/bin/bash
# Font Installation, Fontconfig

function install_fonts {
    # Install the following fonts:
    # Roboto: default font for Google's Android OS
    # Jetbrains Mono: a fantastic monospace font
    # Liberation: font family which aims at metric compatibility with Arial, Times New Roman, and Courier New
    # Nerd Fonts: Provides a plethora of font icons
    paru -S --noconfirm --needed ttf-roboto ttf-jetbrains-mono ttf-liberation ttf-nerd-fonts-symbols

    # Create a symlink for the nerd fonts config
    sudo ln -s /usr/share/fontconfig/conf.avail/10-nerd-font-symbols.conf /etc/fonts/conf.d/10-nerd-font-symbols.conf

    # Create fonts.conf in $HOME to register JetBrains as a monospace font
    if [[ ! -d "~/.config/fontconfig" ]]; then
        mkdir -p ~/.config/fontconfig
    fi

    cat <<EOT > "fonts.conf"
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- set JetBrains Mono as the preferred monospace font (fallback to Nerd Font for missing glyphs) -->
    <alias>
        <family>monospace</family>
        <prefer>
            <family>JetBrains Mono</family>
            <family>Symbols Nerd Font</family>
        </prefer>
    </alias>
    <dir>~/.fonts</dir>
</fontconfig>
EOT

    mv fonts.conf ~/.config/fontconfig/

    # This rebuilds the font-cache, taking into account any changes
    sudo fc-cache -r -v
    fc-cache -r -v

    # Confirm that Jetbrains Mono is the default font used for monospace
    fc-match --verbose monospace
}

function test_coverage {
    # Test font coverage for specific unicode characters required by PowerLine
    echo "Testing font coverage..."
    echo -e "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699 \u2800 \u28ff \u25a0 \u25ff \u2500 \u259f"
}

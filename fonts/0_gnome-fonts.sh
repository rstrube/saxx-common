#!/bin/bash
#|#./ingredients/fonts/0_gnome-fonts.sh #Install and configure sane fonts for Gnome

DIR=$(dirname "$0")
source $DIR/_helper/_font-common-functions.sh

install_fonts

# Configure Gnome to use newly installed fonts
gsettings set org.gnome.desktop.interface font-name "Noto Sans 10"
gsettings set org.gnome.desktop.interface document-font-name "Noto Sans 10"
gsettings set org.gnome.desktop.interface monospace-font-name "JetBrains Mono 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Noto Sans Medium 10"

# Set some sane values for hinting and AA
gsettings set org.gnome.desktop.interface font-hinting "slight"
gsettings set org.gnome.desktop.interface font-antialiasing "rgba"

test_coverage

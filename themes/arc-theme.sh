#!/bin/bash
#|#./ingredients/themes/arc-theme.sh #Arc Theme for Qt and GTK apps

paru -S --noconfirm --needed arc-gtk-theme arc-kde

KVANTUM_CONFIG_DIR=~/.config/Kvantum
KVANTUM_CONFIG_FILE=kvantum.kvconfig

if [[ ! -d "$KVANTUM_CONFIG_DIR" ]]; then
    mkdir -p $KVANTUM_CONFIG_DIR
fi

# Create kvantum config setting Layan theme
cat <<EOT > ${KVANTUM_CONFIG_FILE}
[General]
theme=ArcDark
EOT

mv $KVANTUM_CONFIG_FILE $KVANTUM_CONFIG_DIR

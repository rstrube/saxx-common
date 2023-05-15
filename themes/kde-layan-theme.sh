#!/bin/bash
#|#./ingredients/themes/kde-layan-theme.sh #Layan theme for KDE

paru -S --noconfirm --needed layan-kde-git kvantum-theme-layan-git layan-gtk-theme-git

KVANTUM_CONFIG_DIR=~/.config/Kvantum
KVANTUM_CONFIG_FILE=kvantum.kvconfig

if [[ ! -d "$KVANTUM_CONFIG_DIR" ]]; then
    mkdir -p $KVANTUM_CONFIG_DIR
fi

# Create kvantum config setting Layan theme
cat <<EOT > ${KVANTUM_CONFIG_FILE}
[General]
theme=LayanSolidDark
EOT

mv $KVANTUM_CONFIG_FILE $KVANTUM_CONFIG_DIR

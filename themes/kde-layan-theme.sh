#!/bin/bash
#|#./ingredients/themes/kde-layan-theme.sh #Layan theme for KDE

paru -S --noconfirm --needed layan-kde-git kvantum-theme-layan-git layan-gtk-theme-git

if [[ ! -d "~/.config/Kvantum" ]]; then
    mkdir -p ~/.config/Kvantum
fi

# Create kvantum config setting Layan theme
cat <<EOT > "kvantum.kvconfig"
[General]
theme=LayanSolidDark
EOT

cp kvantum.kvconfig ~/.config/Kvantum
rm kvantum.kvconfig

#!/bin/bash
#|#./ingredients/web/firefox.sh #Firefox

DIR=$(dirname "$0")
source $DIR/../_helper/_common-functions.sh

ENVIRONMENT_FILE=/etc/environment

paru -S --noconfirm --needed firefox

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    echo "Wayland detected, setting env var MOZ_ENABLE_WAYLAND=1 in ${ENVIRONMENT_FILE}"
    echo "MOZ_ENABLE_WAYLAND=1"  | sudo tee -a $ENVIRONMENT_FILE
fi

echo -e "${YELLOW}Additional about:config tweaks worth considering:${NC}"
echo -e "${YELLOW}widget.use-xdg-desktop-portal.file-picker=1 : Use native file picker via XDG desktop portal${NC}"

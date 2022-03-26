#!/bin/bash
#|#./ingredients/fonts/0_fonts.sh #Install and configure sane fonts [TEMPLATE]

DIR=$(dirname "$0")
source $DIR/_helper/_font-common-functions.sh

install_fonts
setup_local_fontconfig

# DE specific steps
# ...

test_coverage

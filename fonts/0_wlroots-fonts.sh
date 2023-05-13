#!/bin/bash
#|#./ingredients/fonts/0_wlroots-fonts.sh #Install for wlroots compositors

DIR=$(dirname "$0")
source $DIR/_helper/_font-common-functions.sh

install_fonts

test_coverage

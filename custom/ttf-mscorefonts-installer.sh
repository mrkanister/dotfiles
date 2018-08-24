#!/bin/bash
#
# Install the package ttf-mscorefonts-installer in the custom section to
# prevent it from causing a glitch in the terminal during the automatic
# installation of all other packages from the software.list file.
#
# See also: d85b825f831f625109abd6b3786a89633d48a9c0

PACKAGE="ttf-mscorefonts-installer"
if ! apt-cache policy $PACKAGE | grep --quiet '(.*)'; then
    exit
fi

sudo apt-get install $PACKAGE

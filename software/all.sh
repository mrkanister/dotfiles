#!/bin/bash

set -e

SOFTWARE="
    cloc
    colordiff
    curl
    devscripts
    git
    golang-1.9
    inkscape
    numlockx
    pwgen
    tmux
    tree
    vim
"

# Filter packages that are already installed to have cleaner output.
TO_INSTALL=$(
    echo $SOFTWARE \
    | xargs \
        dpkg-query -W -f='${Status} ${Package}\n' 2>&1 \
    | grep -v 'install ok installed' \
    | awk '{print $NF}'
)

if [ -z "$TO_INSTALL" ]; then
    exit
fi

echo "dotfiles: install $TO_INSTALL"

sudo apt-get update -qq
echo $TO_INSTALL | xargs -I{} sudo apt-get -y install {}

#!/bin/bash

COMMAND="google-chrome"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

if command -v $COMMAND > /dev/null; then
    exit
fi

echo "dotfiles: install $COMMAND"

wget -q -O /tmp/$COMMAND.deb "$URL"
sudo dpkg -i /tmp/$COMMAND.deb
sudo apt-get install -f

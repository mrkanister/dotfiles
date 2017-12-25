#!/bin/bash

COMMAND="code"
URL="https://go.microsoft.com/fwlink/?LinkID=760868"

if command -v $COMMAND > /dev/null; then
    exit
fi

echo "dotfiles: install $COMMAND"

wget -q -O /tmp/$COMMAND.deb "$URL"
sudo dpkg -i /tmp/$COMMAND.deb
sudo apt-get install -f

#!/bin/bash

set -e

DOTFILES_DIR="$HOME/.config/dotfiles"

echo "dotfiles: bootstrap to $DOTFILES_DIR"

if ! command -v git > /dev/null; then
    echo "dotfiles: install git"
    sudo apt-get update --quiet=2
    sudo apt-get install --quiet=2 git
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "dotfiles: clone git repository"
    git clone --quiet https://github.com/mrkanister/dotfiles.git "$DOTFILES_DIR"
else
    echo "dotfiles: update git repository"
    git -C "$DOTFILES_DIR" pull --ff-only --quiet
fi

echo "dotfiles: command 'dotfiles' successfully installed"
"$DOTFILES_DIR/dotfiles.sh" --skip-update

#/bin/bash

set -e

DOTFILES_DIR=${DOTFILES_DIR:-~/.config/dotfiles}

echo "dotfiles: bootstrap to $DOTFILES_DIR"

if ! command -v git > /dev/null; then
    echo "dotfiles: install git"
    sudo apt-get install -qq git
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "dotfiles: clone git repository"
    git clone -q https://github.com/mrkanister/dotfiles.git "$DOTFILES_DIR"
else
    echo "dotfiles: update git repository"
    git -C "$DOTFILES_DIR" pull -q
fi

TARGET=/usr/local/bin/dotfiles
echo "dotfiles: create symlink: $TARGET -> $DOTFILES_DIR/dotfiles.sh"
sudo ln -sf "$DOTFILES_DIR/dotfiles.sh" "$TARGET"

echo "dotfiles: command 'dotfiles' successfully installed"

#/bin/bash

set -e

DOTFILES_DIR=${DOTFILES_DIR:-~/.config/dotfiles}

echo "dotfiles: bootstrap to $DOTFILES_DIR"

if ! command -v git > /dev/null; then
    sudo apt-get install -y git
fi

if [ ! -d $DOTFILES_DIR ]; then
    echo "dotfiles: clone git repository"
    git clone -q https://github.com/mrkanister/dotfiles.git $DOTFILES_DIR

    echo "dotfiles: create symlink in /usr/local/bin"
    sudo ln -s "${DOTFILES_DIR}/dotfiles.sh" /usr/local/bin/dotfiles
else
    echo "dotfiles: update git repository"
    git -C $DOTFILES_DIR pull -q
fi

dotfiles
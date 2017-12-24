#/bin/bash

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

# make sure the script itself it update-to-date
echo "dotfiles: update git repository"
STATUS=$(git -C "$DOTFILES_DIR" pull)
if [ "$STATUS" != "Already up-to-date." ]; then
    exec "$0"
fi

echo "dotfiles: TODO"

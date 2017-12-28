#/bin/bash

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

# make sure the script itself is update-to-date
echo "dotfiles: update git repository"
STATUS=$(git -C "$DOTFILES_DIR" pull)
if [ "$STATUS" != "Already up-to-date." ]; then
    exec "$0"
fi

echo "dotfiles: install software"
for file in "$DOTFILES_DIR/software/"*.sh; do
    bash "$file"
done

echo "dotfiles: install configurations"
cp -rf "$DOTFILES_DIR/.bashrc.d" "$HOME"
. "$HOME/.bashrc"

echo "dotfiles: TODO"

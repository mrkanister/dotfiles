#/bin/bash

set -e

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

# make sure the script itself is update-to-date
echo "dotfiles: update git repository"
STATUS=$(git -C "$DOTFILES_DIR" pull --ff-only)
if [ "$STATUS" != "Already up-to-date." ]; then
    exec "$0"
fi

echo "dotfiles: install software"
for file in "$DOTFILES_DIR/software/"*.sh; do
    bash "$file"
done

echo "dotfiles: install configurations"
INCLUDE='. <(cat ~/.bashrc.d/*)'
if ! grep --quiet --fixed-strings "$INCLUDE" "$HOME/.bashrc"; then
    echo -e "\n$INCLUDE" >> "$HOME/.bashrc"
fi
cp -rT "$DOTFILES_DIR/HOME" "$HOME"
. "$HOME/.bashrc"

echo "dotfiles: TODO"

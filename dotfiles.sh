#/bin/bash

set -e

DOTFILES_DIR="$(dirname "$(readlink -f "$0")")"

install_repositories() {
    local changes

    local sources_src="$DOTFILES_DIR/ROOT/etc/apt/sources.list.d"
    local sources_dst="/etc/apt/sources.list.d"
    for file in "$sources_src"/*.list; do
        local filename="${file##*/}"
        if [ ! -f "$sources_dst/$filename" ]; then
            echo "dotfiles: - $filename"
            changes=true

            sudo cp "$file" "$sources_dst"
        fi
    done

    local keys_src="$DOTFILES_DIR/ROOT/etc/apt/trusted.pub.d"
    local keys_dst="/etc/apt/trusted.gpg.d"
    for file in "$keys_src"/*.pub; do
        local filename="${file##*/}"
        local file_dst="$keys_dst/${filename%.*}.gpg"
        if [ ! -f "$file_dst" ]; then
            echo "dotfiles: - $filename"
            changes=true

            gpg --dearmor < "$file" \
            | sudo tee "$file_dst" \
            > /dev/null
        fi
    done

    if [ "$changes" = "true" ]; then
        sudo apt-get update -qq
    fi
}

install_software() {
    local to_install=$(
        xargs -a "$DOTFILES_DIR/software.list" \
            apt-get install --dry-run \
        | grep '^Inst ' \
        | cut -d" " -f2
    )

    if [ -z "$to_install" ]; then
        return
    fi

    echo "dotfiles: - $to_install"

    sudo apt-get update -qq
    echo $to_install | xargs sudo apt-get -y install
}

install_configuration() {
    local include='. <(cat ~/.bashrc.d/*)'
    if ! grep --quiet --fixed-strings "$include" "$HOME/.bashrc"; then
        echo -e "\n$include" >> "$HOME/.bashrc"
    fi
    cp -rT "$DOTFILES_DIR/HOME" "$HOME"
    . "$HOME/.bashrc"
}

# make sure the script itself is update-to-date
echo "dotfiles: update dotfiles"
STATUS=$(git -C "$DOTFILES_DIR" pull --ff-only)
if [ "$STATUS" != "Already up-to-date." ]; then
    exec "$0"
fi

echo "dotfiles: check for new repositories"
install_repositories
unset -f install_repositories

echo "dotfiles: check for new software"
install_software
unset -f install_software

echo "dotfiles: check for new configuration"
install_configuration
unset -f install_configuration

echo "dotfiles: all done"

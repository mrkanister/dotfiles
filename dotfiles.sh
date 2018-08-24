#!/bin/bash

set -e

DOTFILES_DIR="$(dirname "$(readlink --canonicalize "$0")")"

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
        sudo apt-get update --quiet=2
    fi
}

install_software() {
    # The call to 'grep' can fail if there a no new packages that need
    # to be installed, so we explicitly want to ignore the return code.
    # shellcheck disable=SC2155
    local to_install=$(
        xargs -a "$DOTFILES_DIR/software.list" \
            apt-cache policy \
        | grep --before-context=1 'Installed: (none)' \
        | grep --only-matching '^\w[^:]*'
    )

    if [ -z "$to_install" ]; then
        return
    fi

    echo "dotfiles: - $(tr '\n' ' ' <<< $to_install)"

    sudo apt-get update --quiet=2
    echo $to_install | xargs sudo apt-get --assume-yes install
}

install_configurations() {
    local include=". <(cat $HOME/.bashrc.d/*)"
    if ! grep --fixed-strings --quiet "$include" "$HOME/.bashrc"; then
        echo -e "\n$include" >> "$HOME/.bashrc"
    fi
    cp --no-target-directory --recursive "$DOTFILES_DIR/HOME" "$HOME"
    . <(cat $HOME/.bashrc.d/*)
}

if [ "$1" != "--skip-update" ]; then
    # make sure the script itself is update-to-date
    echo "dotfiles: update dotfiles"

    pushd "$DOTFILES_DIR" > /dev/null
    git fetch
    if [ "$(git rev-parse master)" == "$(git rev-parse origin/master)" ]; then
        echo "dotfiles: already up to date"
        exit
    fi
    git merge --ff-only
    popd > /dev/null

    # rerun the script which itself may have been updated
    exec "$0" --skip-update
fi

echo "dotfiles: install new repositories"
install_repositories
unset -f install_repositories

echo "dotfiles: install new software"
install_software
unset -f install_software

echo "dotfiles: install new configurations"
install_configurations
unset -f install_configurations

echo "dotfiles: run custom scripts"
for script in "$DOTFILES_DIR/custom/"*; do
    echo "dotfiles: - ${script##*/}"
    bash "$script"
done

echo "dotfiles: all done"

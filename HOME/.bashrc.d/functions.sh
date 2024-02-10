#!/bin/bash

git_multiclone_github() {
    if [ -z "$1" ]; then
        echo "error: missing argument: <user>"
        return 1
    fi

    local user="$1"
    local target="$HOME/code/src/github.com/$user"

    mkdir --parents "$target"

    # https://developer.github.com/v3/#pagination --> default: 30
    curl --silent "https://api.github.com/users/$user/repos?per_page=100" \
    | jq --raw-output '.[].full_name' \
    | xargs -I{} git -C "$target" clone git@github.com:{}.git
}

susu() ( # "(", not "{" --> because of "set -e" in the subscript
    set -e

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade
    sudo apt-get autoremove
    sudo apt-get autoclean
)

pdf_collate() {
    # Merge two PDF files with interleaving pages where:
    #  - A has the odd pages
    #  - B has the even pages in reverse
    pdftk A="$1" B="$2" shuffle A Bend-1 output "$1.$2.collated.pdf"
}

png_alpha_to_white() {
    for img in "$@"; do
        convert "$img" -alpha remove -background white "$img.white"
    done
}

png_white_to_alpha() {
    for img in "$@"; do
        convert "$img" -transparent white "$img.alpha"
    done
}

png_trim() {
    for img in "$@"; do
        convert -trim "$img" "$img.trim"
    done
}

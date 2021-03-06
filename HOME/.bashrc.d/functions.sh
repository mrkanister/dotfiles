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

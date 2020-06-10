#!/bin/bash

EXTENSIONS=$(cat <<EOF
DavidAnson.vscode-markdownlint
golang.Go
mechatroner.rainbow-csv
redhat.vscode-yaml
stkb.rewrap
timonwong.shellcheck
EOF
)

# Extract lines that are unique to the above extensions list.
comm -13 <(code --list-extensions) <(cat <<< "$EXTENSIONS") | \
    while read -r extension; do
        code --install-extension "$extension"
    done

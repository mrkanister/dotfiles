#!/bin/bash

EXTENSIONS=$(cat <<EOF
DavidAnson.vscode-markdownlint
esbenp.prettier-vscode
golang.go
James-Yu.latex-workshop
mechatroner.rainbow-csv
redhat.vscode-yaml
stkb.rewrap
svelte.svelte-vscode
timonwong.shellcheck
EOF
)

# Extract lines that are unique to the above extensions list.
comm -13 <(code --list-extensions) <(cat <<< "$EXTENSIONS") | \
    while read -r extension; do
        code --install-extension "$extension"
    done

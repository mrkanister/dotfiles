#!/bin/bash

EXTENSIONS=$(cat <<EOF
esbenp.prettier-vscode
golang.go
jacobcassidy.css-nesting-syntax-highlighting
jock.svg
mechatroner.rainbow-csv
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

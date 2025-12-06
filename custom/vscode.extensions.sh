#!/bin/bash

EXTENSIONS=$(cat <<EOF
dnut.rewrap-revived
esbenp.prettier-vscode
golang.go
jacobcassidy.css-nesting-syntax-highlighting
jebbs.plantuml
jock.svg
mechatroner.rainbow-csv
svelte.svelte-vscode
timonwong.shellcheck
EOF
)

INSTALLED=$(code --list-extensions)

# Extract lines that are unique to the above extensions list.
comm -13 <(cat <<< "$INSTALLED") <(cat <<< "$EXTENSIONS") | \
    while read -r extension; do
        code --install-extension "$extension"
    done

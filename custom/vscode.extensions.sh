#!/bin/bash

EXTENSIONS=$(cat <<EOF
DavidAnson.vscode-markdownlint
mechatroner.rainbow-csv
ms-vscode.Go
stkb.rewrap
timonwong.shellcheck
EOF
)

# Extract lines that are unique to the above extensions list.
comm -13 <(code --list-extensions) <(cat <<< "$EXTENSIONS") | \
    while read -r extension; do
        code --install-extension "$extension"
    done

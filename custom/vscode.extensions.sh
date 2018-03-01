#!/bin/bash

xargs --max-lines=1 code --install-extension > /dev/null <<EOF
    DavidAnson.vscode-markdownlint
    lukehoban.Go
    stkb.rewrap
    timonwong.shellcheck
EOF

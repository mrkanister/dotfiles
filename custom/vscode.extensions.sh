#!/bin/bash

xargs -L1 code --install-extension > /dev/null <<EOF
    DavidAnson.vscode-markdownlint
    lukehoban.Go
    stkb.rewrap
EOF

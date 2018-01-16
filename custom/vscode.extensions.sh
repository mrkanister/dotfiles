#!/bin/bash

xargs -L1 code --install-extension > /dev/null <<EOF
    lukehoban.Go
    stkb.rewrap
EOF

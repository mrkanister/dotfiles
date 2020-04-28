#!/bin/bash
set -euo pipefail

if command -v python > /dev/null; then
    exit
fi

sudo ln --symbolic /usr/bin/python3 /usr/local/bin/python

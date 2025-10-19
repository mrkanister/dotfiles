#!/bin/bash
set -euo pipefail

BASEDIR="/opt/node"
VERSION="25.0.0"
NODEDIR="$BASEDIR/$VERSION"
URL="https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-x64.tar.xz"

if [[ -d $NODEDIR ]]; then
    exit
fi

sudo mkdir -p $NODEDIR
curl $URL | sudo tar -C $NODEDIR -xJf - --strip-components=1

# Update symlink
sudo ln \
    --force \
    --no-target-directory \
    --symbolic \
    "$NODEDIR" "$BASEDIR/current"

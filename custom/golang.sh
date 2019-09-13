#!/bin/bash
set -euo pipefail

BASEDIR="/opt/go"
VERSION="1.13"
GODIR="$BASEDIR/$VERSION"
URL="https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz"

if [[ -d $GODIR ]]; then
    exit
fi

sudo mkdir -p $GODIR
curl $URL | sudo tar -C $GODIR -xzf - --strip-components=1

# Update symlink
sudo ln \
    --force \
    --no-target-directory \
    --symbolic \
    "$GODIR" "$BASEDIR/current"

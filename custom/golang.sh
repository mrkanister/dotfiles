#!/bin/bash
set -euo pipefail

BASEDIR="/opt/go"
VERSION="1.11.1"
GODIR="$BASEDIR/$VERSION"
URL="https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz"

if [[ -d $GODIR ]]; then
    exit
fi

sudo mkdir -p $GODIR
curl $URL | sudo tar -C $GODIR -xzf - --strip-components=1

# Remove older (other) versions of Go
sudo find $BASEDIR \
    -mindepth 1 -maxdepth 1 \
    -type d \
    ! -wholename $GODIR \
    -exec rm -rf {} \;

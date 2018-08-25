#!/bin/bash
set -euo pipefail

VERSION="1.11"
URL="https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz"
DIRECTORY="/opt/go/$VERSION"

if [[ -d $DIRECTORY ]]; then
    exit
fi

sudo mkdir -p $DIRECTORY
curl $URL | sudo tar -C $DIRECTORY -xzf - --strip-components=1

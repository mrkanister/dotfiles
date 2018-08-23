#!/bin/bash

if command -v dep > /dev/null; then
    exit
fi

mkdir -p "$GOPATH/bin"
wget --quiet --output-document "$GOPATH/bin/dep" \
    "https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64"

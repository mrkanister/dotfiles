#!/bin/bash

if command -v present > /dev/null; then
    exit
fi

go get golang.org/x/tools/cmd/present

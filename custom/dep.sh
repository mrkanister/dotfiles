#!/bin/bash

if command -v dep > /dev/null; then
    exit
fi

go get github.com/golang/dep/cmd/dep

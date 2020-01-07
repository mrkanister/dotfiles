#!/bin/bash

if command -v scc > /dev/null; then
    exit
fi

go get -u github.com/boyter/scc

#!/bin/bash

if command -v scc > /dev/null; then
    exit
fi

go install github.com/boyter/scc@latest

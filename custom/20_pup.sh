#!/bin/bash

if command -v pup > /dev/null; then
    exit
fi

go install github.com/ericchiang/pup@latest

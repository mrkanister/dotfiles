#!/bin/bash

if command -v pup > /dev/null; then
    exit
fi

go get -u github.com/ericchiang/pup

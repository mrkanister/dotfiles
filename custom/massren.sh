#!/bin/bash

if command -v massren > /dev/null; then
    exit
fi

go get -u github.com/laurent22/massren
massren --config editor code > /dev/null

#!/bin/bash

if command -v massren > /dev/null; then
    exit
fi

go get github.com/laurent22/massren@1.4.0
massren --config editor code > /dev/null

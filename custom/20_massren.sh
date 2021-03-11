#!/bin/bash

if command -v massren > /dev/null; then
    exit
fi

go install github.com/laurent22/massren@latest
massren --config editor code > /dev/null

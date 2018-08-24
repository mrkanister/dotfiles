#!/bin/bash

KEYFILE="$HOME/.ssh/id_rsa"

if [ -f "$KEYFILE" ]; then
    exit
fi

ssh-keygen -t rsa -b 4096 -f "$KEYFILE"

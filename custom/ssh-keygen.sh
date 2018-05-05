#!/bin/bash

if [ -f "$HOME/.ssh/id_rsa" ]; then
    exit
fi

ssh-keygen -t rsa -b 4096

#!/bin/bash

kwriteconfig --file "$HOME/.kde/share/config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

kwriteconfig --file "$HOME/.config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

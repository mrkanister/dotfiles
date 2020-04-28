#!/bin/bash

# Enable single-click to open files and folder.
kwriteconfig5 --file "$HOME/.config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

kwriteconfig5 --file "$HOME/.kde/share/config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

# Disable "Switch to Desktop" shortcuts to avoid collisions with VSCode.
for i in 1 2 3 4; do
    kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" \
        --group "kwin" --key "Switch to Desktop $i" "none,none,Switch to Desktop $i"
done

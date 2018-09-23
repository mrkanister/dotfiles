#!/bin/bash

# Enable single-click to open files and folder.
kwriteconfig --file "$HOME/.config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

kwriteconfig --file "$HOME/.kde/share/config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

# Disable "Switch to Desktop" shortcuts to avoid collisions with VSCode.
for i in 1 2 3 4; do
    kwriteconfig --file "$HOME/.config/kglobalshortcutsrc" \
        --group "kwin" --key "Switch to Desktop $i" "none,none,Switch to Desktop $i"
done

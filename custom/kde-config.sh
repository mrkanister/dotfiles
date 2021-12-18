#!/bin/bash

# Set Google Chrome as the default web browser for http and https URLs.
kwriteconfig5 --file "$HOME/.config/kdeglobals" \
    --group "General" --key "BrowserApplication" "google-chrome.desktop"

# Enable single-click to open files and folder.
kwriteconfig5 --file "$HOME/.config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

kwriteconfig5 --file "$HOME/.kde/share/config/kdeglobals" \
    --group "KDE" --key "SingleClick" --type "bool" true

# Don't show "Confirm Close" for more than two open terminals.
kwriteconfig5 --file "$HOME/.config/konsolerc" \
    --group "Notification Messages" --key "CloseAllTabs" --type "bool" true

# Disable "Switch to Desktop" shortcuts to avoid collisions with VSCode.
for i in 1 2 3 4; do
    kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" \
        --group "kwin" --key "Switch to Desktop $i" "none,none,Switch to Desktop $i"
done

# Disable "Show Desktop" as it interferes with "Go to Implementations" in VSCode.
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" \
    --group "plasmashell" --key "show dashboard" "none,Ctrl+F12,Show Desktop"

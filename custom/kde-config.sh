#!/bin/bash

# Reduce the keyboard repeat delay to 250 ms (from 600 ms).
kwriteconfig5 --file "$HOME/.config/kcminputrc" \
    --group "Keyboard" --key "RepeatDelay" "250"

# Increase pointer acceleration to 0.6 (from 0.0).
kwriteconfig5 --file "$HOME/.config/kcminputrc" \
    --group "Mouse" --key "XLbInptPointerAcceleration" "0.6"

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

# Position tab bar below the terminal (default: above the terminal).
kwriteconfig5 --file "$HOME/.config/konsolerc" \
    --group "TabBar" --key "TabBarPosition" "Bottom"

# Disable "Switch to Desktop" shortcuts to avoid collisions with VSCode.
for i in 1 2 3 4; do
    kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" \
        --group "kwin" --key "Switch to Desktop $i" "none,none,Switch to Desktop $i"
done

# Disable "Show Desktop" as it interferes with "Go to Implementations" in VSCode.
kwriteconfig5 --file "$HOME/.config/kglobalshortcutsrc" \
    --group "plasmashell" --key "show dashboard" "none,Ctrl+F12,Show Desktop"

# Hide Plasma browser integration reminder
kwriteconfig5 --file "$HOME/.config/kded5rc" \
    --group "Module-browserintegrationreminder" --key "autoload" --type "bool" false

# Remove "Plasma Discover" from launcher
kwriteconfig5 --file "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc" \
    --group Containments --group 2 --group Applets --group 5 --group Configuration --group General \
    --key launchers "applications:systemsettings.desktop,preferred://filemanager,preferred://browser"

#!/bin/bash

## System Settings

### Keyboard
kwriteconfig5 --file ~/.config/kcminputrc --group Keyboard --key NumLock -- 0
kwriteconfig5 --file ~/.config/kcminputrc --group Keyboard --key RepeatDelay -- 250
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group plasmashell --key "show dashboard" -- "none,Ctrl+F12,Show Desktop"
for i in 1 2 3 4; do
    kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group kwin --key "Switch to Desktop $i" -- "none,none,Switch to Desktop $i"
done

### Display & Monitor
kwriteconfig5 --file ~/.config/kwinrc --group EdgeBarrier --key CornerBarrier -- false
kwriteconfig5 --file ~/.config/kwinrc --group EdgeBarrier --key EdgeBarrier -- 0
kwriteconfig5 --file ~/.config/kwinrc --group NightColor --key Active -- true
kwriteconfig5 --file ~/.config/kwinrc --group NightColor --key Mode -- Constant

### General Behavior
kwriteconfig5 --file ~/.config/kdeglobals --group KDE --key DndBehavior -- MoveIfSameDevice
kwriteconfig5 --file ~/.config/kdeglobals --group KDE --key SingleClick -- true

### Screen Locking
kwriteconfig5 --file ~/.config/kscreenlockerrc --group Daemon --key Autolock -- false
kwriteconfig5 --file ~/.config/kscreenlockerrc --group Daemon --key Timeout -- 0

## Power Management

kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group SuspendAndShutdown --key AutoSuspendAction -- 0
kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group SuspendAndShutdown --key LidAction -- 0
kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group Display --key DimDisplayIdleTimeoutSec -- -1
kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group Display --key DimDisplayWhenIdle -- false
kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group Display --key TurnOffDisplayIdleTimeoutSec -- -1
kwriteconfig5 --file ~/.config/powerdevilrc --group AC --group Display --key TurnOffDisplayWhenIdle -- false

### Sessions
kwriteconfig5 --file ~/.config/ksmserverrc --group General --key loginMode -- emptySession

## App Settings

### Dolphin
kwriteconfig5 --file ~/.config/dolphinrc --group DetailsMode --key PreviewSize -- 16
kwriteconfig5 --file ~/.config/kiorc --group Confirmations --key ConfirmDelete -- false
kwriteconfig5 --file ~/.config/kiorc --group Confirmations --key ConfirmEmptyTrash -- false

### Konsole
kwriteconfig5 --file ~/.config/konsolerc --group "Notification Messages" --key CloseAllTabs -- true
kwriteconfig5 --file ~/.config/konsolerc --group TabBar --key TabBarPosition -- Bottom

### Spectacle

kwriteconfig5 --file ~/.config/spectaclerc --group "General" --key autoSaveImage -- true
kwriteconfig5 --file ~/.config/spectaclerc --group "General" --key rememberSelectionRect -- Always
kwriteconfig5 --file ~/.config/spectaclerc --group "GuiConfig" --key captureMode -- 0

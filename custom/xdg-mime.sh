#!/bin/bash
set -euo pipefail

## /var/lib/snapd/desktop/applications
## /usr/share/applications

xdg-mime default code.desktop text/markdown
xdg-mime default code.desktop text/plain
xdg-mime default code.desktop text/tab-separated-values
xdg-mime default google-chrome.desktop application/pdf
xdg-mime default org.inkscape.Inkscape.desktop image/svg+xml
xdg-mime default vlc_vlc.desktop audio/mpeg
xdg-mime default vlc_vlc.desktop video/mpeg

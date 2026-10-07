#!/bin/bash
set -euo pipefail

SOUNDS_FOLDER="/usr/share/sounds"

if [[ -d ${SOUNDS_FOLDER} ]]; then
    sudo rm -rf ${SOUNDS_FOLDER}
fi

#!/bin/bash

if command -v youtube-dl > /dev/null; then
    sudo youtube-dl --update
    exit
fi

URL='https://yt-dl.org/downloads/latest/youtube-dl'

sudo curl -L "$URL" -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

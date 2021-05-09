#!/bin/bash

alias dotfiles="\$HOME/.config/dotfiles/dotfiles.sh"

alias ..='cd ..'

alias igrep='grep -riI'

alias ll='ls --classify --group-directories-first --human-readable -l -X'

alias top='top -d 1'

alias tree='tree --dirsfirst'

alias wig='tig --ignore-all-space'

alias xclip='xclip -selection clipboard'

alias xopen='xdg-open'

alias youtube-dl='youtube-dl --output "%(title)s.%(ext)s"'

alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'

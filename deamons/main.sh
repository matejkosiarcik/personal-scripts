#!/bin/sh
set -euf

cd "$(dirname "$0")"
mkdir -p "$HOME/.log"

mkdir -p "$HOME/Pictures/Import - Raw"
nohup sh photo-import/main.sh 2>&1 | ts '%Y-%m-%d %H:%M:%.S |' >>"$HOME/.log/photo-import.txt" &
nohup sh screenrecording-rename/main.sh 2>&1 | ts '%Y-%m-%d %H:%M:%.S |' >>"$HOME/.log/screenrecording-rename.txt" &
nohup sh screenshots-rename/main.sh 2>&1 | ts '%Y-%m-%d %H:%M:%.S |' >>"$HOME/.log/screenshots-rename.txt" &

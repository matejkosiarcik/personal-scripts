#!/bin/sh
set -euf

cd "$(dirname $0)"
mkdir -p "$HOME/.log"

echo "$PWD"
nohup sh photo-import/main.sh >>"$HOME/.log/photo-import.stdout.txt" 2>>"$HOME/.log/photo-import.stderr.txt" &
nohup sh screenrecording-rename/main.sh >>"$HOME/.log/screenrecording-rename.stdout.txt" 2>>"$HOME/.log/screenrecording-rename.stderr.txt" &
nohup sh screenshots-rename/main.sh >>"$HOME/.log/screenshots-rename.stdout.txt" 2>>"$HOME/.log/screenshots-rename.stderr.txt" &

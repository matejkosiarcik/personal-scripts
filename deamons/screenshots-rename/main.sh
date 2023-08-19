#!/bin/sh
set -euf

cd "$(dirname "$0")"
project_root="$(dirname "$(dirname "$PWD")")"
PATH="$PATH:/opt/homebrew/bin:$project_root/dependencies/venv/bin"

# Set [and create] target directory
watchdir="$HOME/Pictures/Screenshots"
if [ ! -d "$watchdir" ]; then
    mkdir -p "$watchdir"
fi

# Rename existing files
tmpfile="$(mktemp)"
find "$watchdir" -maxdepth 1 -type f -iname '*.png' -print0 >"$tmpfile"
xargs -0 -n1 sh rename.sh <"$tmpfile"
rm -f "$tmpfile"

# Watch for changes and rename newly added files
watchmedo shell-command "$watchdir" \
    --wait \
    --quiet \
    --ignore-directories \
    --patterns '*.png' \
    --command 'if [ "$watch_event_type" = created ] && [ "$watch_object" = file ]; then sh rename.sh "$watch_src_path"; fi'
# NOTE: We could also listen for "move" events, but it would be really easy to fall into infinite loop

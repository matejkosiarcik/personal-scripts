#!/bin/sh
set -euf

if printf '%s\n' "$PATH" | grep venv; then
    printf "Can't run setup in venv\n" >&1
    exit 1
fi

pip3 install --requirement "$(dirname "$0")/requirements.txt"

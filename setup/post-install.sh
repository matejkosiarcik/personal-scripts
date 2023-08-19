#!/bin/sh
set -euf

rm -rf "$HOME/.bin/dependencies/venv"
(cd "$HOME/.bin/dependencies" &&
    python3 -m venv venv &&
    PATH="$PWD/venv/bin:$PATH" python3 -m pip install --requirement requirements.txt)

#!/bin/sh
set -euf

# Clean old scripts
rm -rf "$HOME/.matejkosiarcik/scripts" "$HOME/.matejkosiarcik/deamons"

# Setup directories
mkdir -p "$HOME/.matejkosiarcik/scripts" "$HOME/.matejkosiarcik/deamons"

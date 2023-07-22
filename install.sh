#!/bin/sh
set -euf

sh setup/system-dependencies/system-setup.sh
make dotbot

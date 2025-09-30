#!/bin/bash

# slurp and satty
# disabled this for now since it itÄs not mature enough
# pkill slurp || hyprshot -m ${1:-region} --raw |
#   satty --filename - \
#     --output-filename "/tmp/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png" \
#     --early-exit \
#     --actions-on-enter save-to-clipboard \
#     --copy-command 'wl-copy'
#
#

flameshot gui

#!/usr/bin/env bash

# Toggle: If running, kill it; otherwise, launch it
if pgrep -f "wayland-app-id=motioneye-cam" > /dev/null; then
    pkill -f "wayland-app-id=motioneye-cam"
else
    mpv --wayland-app-id=motioneye-cam \
        --title="MotionEye Camera" \
        --no-osc \
        --no-osd-bar \
        --no-input-default-bindings \
        --no-border \
        --ontop \
        "http://10.32.0.30:8081" &
fi

#!/usr/bin/env sh

# Kill all running bar processes
killall -q polybar

# Wait until all processes have been terminated
while pgrep -x polybar > /dev/null; do sleep 1; done

#relaunch polybar
polybar top




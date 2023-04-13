#!/usr/bin/env sh

# Kill all running bar processes
killall -q polybar

# Wait until all processes have been terminated
while pgrep -x polybar > /dev/null; do sleep 1; done

#relaunch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

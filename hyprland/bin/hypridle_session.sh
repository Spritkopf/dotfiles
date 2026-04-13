#!/bin/sh
 
if [ "$1" = "lock" ]; then
  echo "inactive" > /tmp/teams-for-linux-idle-state-$USER
  pidof hyprlock || hyprlock
elif [ "$1" = "unlock" ]; then
  echo "active" > /tmp/teams-for-linux-idle-state-$USER
fi

#!/bin/sh
 
if [ "$1" = "on" ]; then
    echo "FAKE IDLE: set state to IDLE"
    echo "inactive" > /tmp/teams-for-linux-idle-state-$USER
elif [ "$1" = "off" ]; then
    echo "FAKE IDLE: set state to ACTIVE"
    echo "active" > /tmp/teams-for-linux-idle-state-$USER
fi

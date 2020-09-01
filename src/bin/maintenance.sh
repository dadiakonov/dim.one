#!/bin/sh

# switch maintenance mode on/off
FILE=/opt/dim/public/maintenance.lock
if test -f "$FILE"; then
    rm "$FILE"
else
    touch "$FILE"
fi

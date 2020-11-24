#!/bin/bash

player_status=$(playerctl --player=spotify,cumulonimbus status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo " $(playerctl metadata artist 2> /dev/null) - $(playerctl metadata title 2> /dev/null)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata artist 2> /dev/null) - $(playerctl metadata title 2> /dev/null)"
else
    echo ""
fi

#!/bin/bash

INTERNAL_DISPLAY="eDP-1"
EXTERNAL_DISPLAY_1="DP-1-2"
EXTERNAL_DISPLAY_2="DP-2-2"

if xrandr | grep -q "^$EXTERNAL_DISPLAY_1 connected"; then
    EXTERNAL_DISPLAY=$EXTERNAL_DISPLAY_1
    echo "External display 1 connected"
elif xrandr | grep -q "^$EXTERNAL_DISPLAY_2 connected"; then
    EXTERNAL_DISPLAY=$EXTERNAL_DISPLAY_2
    echo "External display 2 connected"
else
    EXTERNAL_DISPLAY=""
    echo "No external display connected"
fi

if [ -n "$EXTERNAL_DISPLAY" ]; then
    xrandr --output $EXTERNAL_DISPLAY --mode 2560x1440 --pos 0x0
    xrandr --output $INTERNAL_DISPLAY --mode 2048x1152 --pos 0x1440 --primary
    echo "Set up external display"
else
    xrandr --output $INTERNAL_DISPLAY --mode 2048x1152 --pos 0x0 --primary
    xrandr --output $EXTERNAL_DISPLAY_1 --off
    xrandr --output $EXTERNAL_DISPLAY_2 --off
    echo "Set up internal display only"
fi

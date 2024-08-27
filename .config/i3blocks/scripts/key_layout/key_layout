#!/usr/bin/env bash

# Get the current layout
LAYOUT=$(xkblayout-state print %s)

# Toggle the layout
if [[ "$LAYOUT" == "us" ]]; then
    setxkbmap de
else
    setxkbmap us
fi

# Send the signal to i3blocks
pkill -RTMIN+1 i3blocks

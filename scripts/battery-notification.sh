#!/usr/bin/bash

# Make notify-send work with crontab
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DISPLAY=:0

percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -oP 'percentage:\s*\K\d+')
if [ "$percentage" -lt 20 ]; then
    notify-send "Battery Warning" "Battery level low ($percentage%)." --urgency="critical"
elif [ "$percentage" -lt 50 ]; then
    notify-send "Battery Warning" "Battery half empty ($percentage%)." --urgency="low"
elif [ "$percentage" == 100 ]; then
    notify-send "Battery Warning" "Battery full ($percentage%)." --urgency="low"
fi

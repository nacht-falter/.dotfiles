#!/usr/bin/bash

# Make notify-send work with crontab
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DISPLAY=:0

percentage=$(cat /sys/class/power_supply/BAT0/capacity)
discharging=$(grep -q 'Discharging' /sys/class/power_supply/BAT0/status && echo true || echo false)

if [ "$discharging" == true ]; then
	if [ "$percentage" -lt 20 ]; then
		notify-send "Battery Warning" "Battery level: ($percentage%)." --urgency="critical"
		echo "false" >~/.battery-notification-status
		rm ~/.battery-notification-status
	elif [ "$percentage" -lt 50 ]; then
		notify-send "Battery Warning" "Battery level: ($percentage%)." --urgency="medium"
		echo "false" >~/.battery-notification-status
		rm ~/.battery-notification-status
	fi
fi
if [ "$percentage" == 100 ] && [[ ! -f ~/.battery-notification-status ]]; then
	notify-send "Battery Warning" "Battery charged" --urgency="low"
	touch ~/.battery-notification-status
fi

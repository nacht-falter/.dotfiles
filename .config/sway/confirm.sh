#!/bin/bash
case "$1" in
shutdown)
	response=$(echo "" | dmenu -p "Shutdown? y|n")
	if [[ "$response" == "y" ]]; then
		playerctl pause
		systemctl poweroff
	fi
	;;
reboot)
	response=$(echo "" | dmenu -p "Reboot? y|n")
	if [[ "$response" == "y" ]]; then
		playerctl pause
		systemctl reboot
	fi
	;;
exit)
	response=$(echo "" | dmenu -p "Exit? y|n")
	if [[ "$response" == "y" ]]; then
		playerctl pause
		swaymsg exit
	fi
	;;
suspend)
	response=$(echo "" | dmenu -p "Suspend? y|n")
	if [[ "$response" == "y" ]]; then
		playerctl pause
		systemctl suspend
	fi
	;;
esac

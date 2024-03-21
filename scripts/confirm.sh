#!/usr/bin/bash
response=$(echo "" | dmenu -p "Lock (l), Exit (e), Suspend (s), Hibernate (h), Reboot (r), Shutdown (x)?")
case "$response" in
l | L | lock | Lock)
	playerctl pause
	swaylock -f -c 000000
	;;
e | E | exit | Exit)
	playerctl pause
	swaymsg exit
	;;
s | S | suspend | Suspend)
	playerctl pause
	systemctl suspend
	;;
h | H | hibernate | Hibernate)
	playerctl pause
	systemctl hibernate
	;;
r | R | reboot | Reboot)
	playerctl pause
	systemctl reboot
	;;
x | X | shutdown | Shutdown)
	playerctl pause
	systemctl poweroff
	;;
esac

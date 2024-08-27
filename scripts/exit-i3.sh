#!/usr/bin/bash
response=$(echo "" | dmenu -p "Lock (l), Exit (e), Suspend (s), Reboot (r), Shutdown (x)?")
case "$response" in
l | L | lock | Lock)
	playerctl pause
	i3lock -c 000000
	;;
e | E | exit | Exit)
	/home/johannes/.dotfiles/scripts/i3-resurrect.sh save
	playerctl pause
	i3-msg exit
	;;
s | S | suspend | Suspend)
	playerctl pause
	systemctl suspend
	;;
# h | H | hibernate | Hibernate)
# 	playerctl pause
# 	systemctl hibernate
# 	;;
r | R | reboot | Reboot)
	/home/johannes/.dotfiles/scripts/i3-resurrect.sh save
	playerctl pause
	systemctl reboot
	;;
x | X | shutdown | Shutdown)
	/home/johannes/.dotfiles/scripts/i3-resurrect.sh save
	playerctl pause
	systemctl poweroff
	;;
esac

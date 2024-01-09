#!/bin/bash

while true; do
	selected_word=$(echo "" | dmenu -p "Dictionary Lookup:")

	# dismiss existing notifications
	makoctl dismiss

	if [ -n "$selected_word" ]; then
		lang=$(echo "" | dmenu -p "Select language (default: en)")
		if [ -z "$lang" ]; then
			lang="gcide"
		fi
		notify-send "dictd results" "$(dict -d "$lang" "$selected_word")" -c "dict"
	else
		break
	fi
done

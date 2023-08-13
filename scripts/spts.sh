#!/usr/bin/bash
# A little wrapper script for spotify-tui
# Can be executed from command line with artist and album arguments
# If no arguments are provided, dmenu is used to get arguments
if [ -z "$1" ]; then
	artist=$(echo "" | dmenu -p "Enter artist")
	if [ -z "$artist" ]; then
		exit
	fi
		album=$(echo "" | dmenu -p "Enter album")
	else
		artist=$1
		album=$2
	fi
if [ -z "$album" ]; then
	spt p --name "$artist" -a
else
	result=$(spt s "$album" -b -f "%a:%u" --limit 50 | grep -i "$artist:")
	artist=$(echo "$result" | grep -io "$artist")
	uri=${result/"$artist":/}
	spt p -u "$uri" -f "%s %a: %b - %t"
fi

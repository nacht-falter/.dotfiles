#!/bin/bash
# A little wrapper script for spotify-tui
# Can be executed from command line with artist and album arguments
# If no arguments are provided, dmenu is used to get arguments

notification_timeout=2000

# Get artist and album from command line arguments or dmenu
if [ -z "$1" ]; then
	artist=$(echo "" | dmenu -p "Enter artist")
	if [ -z "$artist" ]; then
		exit
	fi
	album=$(echo "" | dmenu -p "Enter album")
else
	artist="$1"
	album="$2"
fi

# Capitalize artist and album
artist=$(echo "$artist" | sed -E 's/(^| )([a-z])/\1\u\2/g')
album=$(echo "$album" | sed -E 's/(^| )([a-z])/\1\u\2/g')

if ! spt s "$artist" -a | grep "$artist"; then
	notify-send "Spotify" "Artist $artist not found" -t "$notification_timeout" -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
	exit
fi

# Check if album is empty and if so, play artist top tracks
if [ -z "$album" ]; then
	spt p --name "$artist" -a > /dev/null 2>&1
	notify-send "Spotify" "Playing top tracks by $artist" -t "$notification_timeout" -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png


# Otherwise, search album and filter by artist, then play it
else
	if ! spt s "$artist" -a | grep "$artist"; then
		notify-send "Spotify" "Artist $artist not found" -t "$notification_timeout" -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
		exit
	fi
	response_albums=$(spt s "$album" -b -f "%a:%u" --limit 50)
	echo "$response_albums"
	if [ -z "$response_albums" ]; then
		notify-send "Spotify" "Album $album not found" -t "$notification_timeout" -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
		exit
	fi
	filtered_albums=$(echo "$response_albums" | grep -i "$artist:")
	echo "$filtered_albums"
	if [ -z "$filtered_albums" ]; then
		notify-send "Spotify" "Album $album by $artist not found" -t "$notification_timeout" -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
		exit
	fi
	response_artist=$(echo "$response_albums" | grep -io -m 1 "$artist")
	uri=${filtered_albums/"$response_artist":/}
	spt p -u "$uri" > /dev/null 2>&1
fi

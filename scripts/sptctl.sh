#!/usr/bin/bash
# Control spotify playback from command line using spotify-tui
notification_timeout=1000

if [[ "$3" ]]; then
	step_size="$3"
else
	step_size=10
fi

player=$(playerctl -l | grep spotify)
if [[ "$player" ]]; then
	if [[ "$1" == "next" ]] && playerctl -p spotify next; then
		notify-send "Spotify" "Next track" -t $notification_timeout -i ~/snap/spotify/spotify-icon.png
	elif [[ "$1" == "prev" ]] && playerctl -p spotify previous; then
		notify-send "Spotify" "Previous track" -t $notification_timeout -i ~/snap/spotify/spotify-icon.png
	elif [[ "$1" == "toggle" ]] && playback=$(playerctl -p spotify status) && playerctl -p spotify play-pause; then
		notify-send "Spotify" "Playback $playback" -t $notification_timeout -i ~/snap/spotify/spotify-icon.png
	elif [[ "$1" == "vol" ]] && current_volume=$(($(playerctl -p spotify volume) * 100)); then
		if [[ "$2" == "up" ]]; then
			new_volume="$((current_volume > (100 - step_size) ? 100 : current_volume + step_size))"
			playerctl -p spotify volume $((new_volume / 100))
		else
			new_volume="$((current_volume < step_size ? 0 : current_volume - step_size))"
		fi
		notify-send "Spotify" "Volume: $new_volume" -t $notification_timeout -i ~/snap/spotify/spotify-icon.png
	fi
else
	notify-send "Spotify" "No client connected" -t $notification_timeout -i ~/snap/spotify/spotify-icon.png
fi

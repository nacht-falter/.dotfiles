#!/usr/bin/bash
# Control spotify playback from command line using spotify-tui
notification_timeout=1000

if [[ "$3" ]]; then
	step_size="$3"
else
	step_size=10
fi

if [[ "$1" == "next" ]] && spt pb -n; then
	notify-send "Spotify" "Next track" -t $notification_timeout -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
elif [[ "$1" == "prev" ]] && spt pb -p; then
	notify-send "Spotify" "Previous track" -t $notification_timeout -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
elif [[ "$1" == "toggle" ]] && playback=$(spt pb -t -f %s); then
	notify-send "Spotify" "Playback $playback" -t $notification_timeout -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
elif [[ "$1" == "vol" ]] && current_volume=$(spt pb -f %v); then
	if [[ "$2" == "up" ]]; then
		new_volume="$((current_volume > (100 - step_size) ? 100 : current_volume + step_size))"
		spt pb -v $new_volume
	else
		new_volume="$((current_volume < step_size ? 0 : current_volume - step_size))"
		spt pb -v $new_volume
	fi
	notify-send "Spotify" "Volume: $new_volume" -t $notification_timeout -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
else
	notify-send "Spotify" "No client connected" -t $notification_timeout -i /snap/spotify/67/usr/share/spotify/icons/spotify-linux-32.png
fi

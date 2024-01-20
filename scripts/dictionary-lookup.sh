#!/bin/bash

# List of available languages
available_languages=$(dict -D | grep -e eng-deu -e deu-eng -e english -e gcide | awk '{print $1}')
# read lines from available_languages into an array
for line in $available_languages; do
		languages+=("$line")
done

while true; do
    selected_word=$(echo "" | dmenu -p "Dictionary Lookup:")

    # Dismiss existing notifications
    makoctl dismiss

    if [ -n "$selected_word" ]; then
        # Display language selection dropdown
        selected_lang=$(printf '%s\n' "${languages[@]}" | dmenu -p "Select language:")

        # Set default language if no selection is made
        if [ -z "$selected_lang" ]; then
            selected_lang="gcide"
        fi

				response=$(dict -d "$selected_lang" "$selected_word")
				if [ -n "$response" ]; then
					notify-send "Dictionary" "$response" -c dict
				else
					notify-send "Dictionary" "No definition found for $selected_word"
				fi
    else
        break
    fi
done

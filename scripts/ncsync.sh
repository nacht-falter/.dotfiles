creds=$(gpg -d -q ~/.nccreds.gpg)
user=$(echo "$creds" | awk 'NR==1')
password=$(echo "$creds" | awk 'NR==2')
path=$(echo "$creds" | awk 'NR==3')
url=$(echo "$creds" | awk 'NR==4')

if nextcloudcmd -u "$user" -p "$password" "$path" "$url"; then
		echo "$(date): Nextcloud sync successful" > .nextcloud.log
else
		echo "$(date): Nextcloud sync failed" > .nextcloud.log
fi


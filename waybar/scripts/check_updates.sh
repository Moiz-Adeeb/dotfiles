#!/bin/bash

# Explicitly use the safe unprivileged DB location for systemd user scope
export CHECKUPDATES_DB="/tmp/checkup-db-$UID"

# Fetch updates safely and filter out empty lines
update_list=$(/usr/bin/checkupdates 2>/dev/null | grep -v '^$')

if [ -z "$update_list" ]; then
    updates=0
    echo '{"text": " NO UPDATES", "alt": "no-updates", "class": "updated"}' > /tmp/pacman_updates.json
else
    updates=$(echo "$update_list" | wc -l)
    echo "{\"text\": \" $updates UPDATES\", \"alt\": \"updates-available\", \"class\": \"pending\"}" > /tmp/pacman_updates.json
fi

# Fix: Only signal the actual binary, avoiding self-killing matches
pkill -RTMIN+8 -x waybar


#!/bin/bash

set +e
update_list=$(checkupdates 2>/dev/null)

if [ -z "$update_list" ]; then
    updates=0
    # echo '{"text": "NO UPDATES", "alt": "no-updates", "class": "updated"}' > /tmp/pacman_updates.json
    echo '{"text": "", "alt": "no-updates", "class": "updated"}' > /tmp/pacman_updates.json
else
    updates=$(echo "$update_list" | wc -l)
    echo "{\"text\": \"$updates UPDATES\", \"alt\": \"updates-available\", \"class\": \"pending\"}" > /tmp/pacman_updates.json
fi
pkill -RTMIN+8 -x waybar

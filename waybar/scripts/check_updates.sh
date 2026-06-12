#!/bin/bash

set +e

# Fetch updates safely using pacman-contrib's utility
update_list=$(checkupdates 2>/dev/null)

if [ -z "$update_list" ]; then
    updates=0
    echo '{"text": "NO UPDATES", "alt": "no-updates", "class": "updated"}' > /tmp/pacman_updates.json
else
    # Count the lines in the update list safely
    updates=$(echo "$update_list" | wc -l)
    echo "{\"text\": \"$updates UPDATES\", \"alt\": \"updates-available\", \"class\": \"pending\"}" > /tmp/pacman_updates.json
fi

# Fix: Only signal the actual binary, avoiding self-killing matches
pkill -RTMIN+8 -x waybar


# set +e
#
# # Explicitly use the safe unprivileged DB location for systemd user scope
# #export CHECKUPDATES_DB="/tmp/checkup-db-$UID"
#
# # Fetch updates safely and filter out empty lines
# update_list=$(dnf check-update --quiet 2>/dev/null | grep -v '^$')
#
# if [ -z "$update_list" ]; then
#     updates=0
#     echo '{"text": " NO UPDATES", "alt": "no-updates", "class": "updated"}' > /tmp/dnf_pacman.json
# else
#     updates=$(echo "$update_list" | wc -l)
#     echo "{\"text\": \" $updates UPDATES\", \"alt\": \"updates-available\", \"class\": \"pending\"}" > /tmp/dnf_pacman.json
# fi
#
# # Fix: Only signal the actual binary, avoiding self-killing matches
# pkill -RTMIN+8 -x waybar


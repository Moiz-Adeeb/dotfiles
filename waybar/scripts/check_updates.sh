#!/bin/bash

set +e

# Fetch updates safely
update_list=$(dnf check-update --quiet 2>/dev/null | grep -v '^$')

if [ -z "$update_list" ]; then
    updates=0
    echo "{\"text\": \" SYSTEM UP TO DATE\", \"alt\": \"no-updates\", \"class\": \"updated\"}" > /tmp/dnf_updates.json
else
    updates=$(echo "$update_list" | wc -l)
    echo "{\"text\": \" $updates UPDATES AVAILABLE\", \"alt\": \"updates-available\", \"class\": \"pending\"}" > /tmp/dnf_updates.json
fi

# Send the real-time signal specifically to your user-level Waybar process
pkill -f -SIGRTMIN+8 "waybar"

# # Calculate updates and write JSON to a cache file
# updates=$(dnf check-update --quiet | grep -v '^$' | wc -l)
#
# if [ "$updates" -gt 0 ]; then
#     echo "{\"text\": \" $updates UPDATES\", \"alt\": \"updates-available\"}" > /tmp/dnf_updates.json
# else
#     echo "{\"text\": \" SYSTEM UP TO DATE\", \"alt\": \"no-updates\"}" > /tmp/dnf_updates.json
# fi
#
# # Tell Waybar to instantly refresh its display
# pkill -SIGRTMIN+8 waybar


#!/bin/bash
# A simple script to stream dwl tags into waybar without an IPC patch

# Create a clean data log path if it doesn't exist
TAG_FILE="$HOME/.cache/dwltags"
touch "$TAG_FILE"

# Monitor the file for updates and format it as JSON for Waybar
tail -f "$TAG_FILE" | while read -r line; do
    # Simple JSON payload generation to send workspace text directly to waybar
    echo "{\"text\": \"$line\", \"class\": \"dwl-tags\"}"
done


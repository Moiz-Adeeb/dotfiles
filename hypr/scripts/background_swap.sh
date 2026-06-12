#!/bin/bash

# Set the directory where the backgrounds are stored
BACKGROUND_DIR="$HOME/.config/backgrounds"

# Get the list of backgrounds
BACKGROUND_LIST=("$BACKGROUND_DIR"/*)

# Read the current wallpaper from the background file
CURRENT_BACKGROUND=$(cat "$HOME/.background_wallpaper")
echo "Current background: $CURRENT_BACKGROUND"

# Find the index of the current background in the list
CURRENT_INDEX=0
for i in "${!BACKGROUND_LIST[@]}"; do
    if [[ "${BACKGROUND_LIST[$i]}" == "$CURRENT_BACKGROUND" ]]; then
        CURRENT_INDEX=$i
        echo "Current index: $CURRENT_INDEX"
        break
    fi
done

# Calculate the index of the next background
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#BACKGROUND_LIST[@]} ))
echo "Next index: $NEXT_INDEX"

# Get the path of the next background
NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"
echo "Next background: $NEXT_BACKGROUND"

# Save the next background to the background file
echo "$NEXT_BACKGROUND" > "$HOME/.background_wallpaper"

# Restart swaybg service to apply the new background
systemctl --user restart swaybg

# Send a notification with the new background name
notify-send -i "$NEXT_BACKGROUND" "Background changed" "$(basename $NEXT_BACKGROUND)"

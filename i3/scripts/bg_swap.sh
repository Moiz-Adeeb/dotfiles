!/usr/bin/env bash

# 1. Directory and List
BACKGROUND_DIR="$HOME/.config/backgrounds"
BACKGROUND_LIST=("$BACKGROUND_DIR"/*)

# 2. Get Current Wallpaper (Using feh's last set image)
# We check the .fehbg file which feh creates to store the current choice
CURRENT_BACKGROUND=$(grep -oP "(?<=--bg-fill ').*(?=')" $HOME/.fehbg)
wallpaper=$(basename "$CURRENT_BACKGROUND")

# 3. Find Index
CURRENT_INDEX=0
for i in "${!BACKGROUND_LIST[@]}"; do
    if [[ "${BACKGROUND_LIST[$i]}" == "${CURRENT_BACKGROUND}" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# 4. Calculate Next
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#BACKGROUND_LIST[@]} ))
NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"

# 5. Set the Background (The i3 way)
# feh replaces swaybg/swaymsg on i3
feh --bg-fill "$NEXT_BACKGROUND"

# 6. Notifications
#notify-send -i "$NEXT_BACKGROUND" "Background changed" "$(basename "$NEXT_BACKGROUND")"


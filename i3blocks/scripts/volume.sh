#!/bin/sh

# 1. Get current status
CUR_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -1)
IS_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes" && echo "yes" || echo "no")

# 2. Handle Mouse Clicks/Scrolls
case $BLOCK_BUTTON in
  1) kitty --class=float_small -e wiremix ;; 
  3) pactl set-sink-mute @DEFAULT_SINK@ toggle ;; # Right click to Mute
  4) [ "$CUR_VOL" -lt 100 ] && pactl set-sink-volume @DEFAULT_SINK@ +1% ;; 
  5) pactl set-sink-volume @DEFAULT_SINK@ -1% ;; 
esac

# 3. Final Output (Refresh status after click)
UPDATED_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes" && echo "yes" || echo "no")
UPDATED_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -1)

# if [ "$UPDATED_MUTED" = "yes" ]; then
#     echo " Muted" # Or any muted icon you prefer
# else
#     echo " $UPDATED_VOL%"
# fi

if [ "$UPDATED_MUTED" = "yes" ]; then
    echo "<span color='#707880'></span>"
else
    echo " $UPDATED_VOL%"
fi



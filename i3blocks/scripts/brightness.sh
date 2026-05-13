#!/bin/sh

# Define the monitor name from your polybar config
MONITOR="HDMI-1"

# 1. Handle Scrolling
case $BLOCK_BUTTON in
  4) # Scroll Up
    brightnessctl set +5%
    xrandr --output "$MONITOR" --brightness $(xrandr --verbose | grep -m 1 -A 5 "$MONITOR" | grep "Brightness" | awk '{print ($2 + 0.05 > 1.0 ? 1.0 : $2 + 0.05)}')
    ;;
  5) # Scroll Down
    brightnessctl set 5%-
    xrandr --output "$MONITOR" --brightness $(xrandr --verbose | grep -m 1 -A 5 "$MONITOR" | grep "Brightness" | awk '{print ($2 - 0.05 < 0.1 ? 0.1 : $2 - 0.05)}')
    ;;
esac

# 2. Output to bar (Hardware level)
# This gets the current percentage for the label
brightnessctl -m | cut -d, -f4


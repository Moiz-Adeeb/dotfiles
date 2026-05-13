#!/bin/bash

# 1. Handle Laptop Brightness
brightnessctl set "$1"

# 2. Handle External Monitor (if connected)
MONITOR="HDMI-1"

# Check if HDMI-1 is connected
if xrandr | grep -q "$MONITOR connected"; then
    # Get current brightness
    current=$(xrandr --verbose | grep -m 1 -A 5 "$MONITOR" | grep "Brightness" | awk '{print $2}')
    
    # Do the math based on the argument passed (+ or -)
    if [ "$1" == "+10%" ]; then
        new=$(echo "$current + 0.1" | bc)
    else
        new=$(echo "$current - 0.1" | bc)
    fi

    # Apply limits (don't go above 1.0 or below 0.1)
    if (( $(echo "$new > 1.0" | bc -l) )); then new=1.0; fi
    if (( $(echo "$new < 0.1" | bc -l) )); then new=0.1; fi

    xrandr --output "$MONITOR" --brightness "$new"
fi


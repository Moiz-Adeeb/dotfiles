#!/bin/sh

LAPTOP_PROFILE="Laptop-Only"
DUAL_PROFILE="Dual-Screen"
EXT_ONLY_PROFILE="External-Only"

# Check if HDMI is physically plugged in
if ! hyprctl monitors all -j | jq -e '.[] | select(.name == "HDMI-A-1")' > /dev/null; then
    kanshictl switch "$LAPTOP_PROFILE"
    notify-send -a "Display Manager" "Switched to $LAPTOP_PROFILE"
    exit 0
fi

# Check if eDP-1 is disabled to toggle the state
if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
    kanshictl switch "$DUAL_PROFILE"
    notify-send -a "Display Manager" "Switched to $DUAL_PROFILE"
else
    kanshictl switch "$EXT_ONLY_PROFILE"
    notify-send -a "Display Manager" "Switched to $EXT_ONLY_PROFILE"
fi


# DUAL_PROFILE="Dual-Screen"
# EXT_ONLY_PROFILE="External-Only"
#
# if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
#     kanshictl switch "$DUAL_PROFILE"
# else
#     kanshictl switch "$EXT_ONLY_PROFILE"
# fi

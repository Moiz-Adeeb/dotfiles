#!/bin/sh

DUAL_PROFILE="Dual-Screen"
EXT_ONLY_PROFILE="External-Only"

if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
    kanshictl switch "$DUAL_PROFILE"
else
    kanshictl switch "$EXT_ONLY_PROFILE"
fi

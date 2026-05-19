#!/bin/bash

# Profile names must match your kanshi config exactly
# DUAL_PROFILE="Dual-Screen"
# EXT_ONLY_PROFILE="External-Only"

#!/bin/bash

# Profile names must match your kanshi config exactly
DUAL_PROFILE="Dual-Screen"
EXT_ONLY_PROFILE="External-Only"

# Use absolute paths for system tools to guarantee Sway can always find them
SWAYMSG_BIN=$(which swaymsg 2>/dev/null || echo "/usr/bin/swaymsg")
JQ_BIN=$(which jq 2>/dev/null || echo "/usr/bin/jq")
KANSHICTL_BIN=$(which kanshictl 2>/dev/null || echo "/usr/bin/kanshictl" || echo "$HOME/.cargo/bin/kanshictl")

# Check if eDP-1 is currently ACTIVE
if "$SWAYMSG_BIN" -t get_outputs | "$JQ_BIN" -e '.[] | select(.name == "eDP-1" and .active == true)' > /dev/null; then
    # If eDP-1 is currently ON, switch to External-Only to turn it OFF
    "$KANSHICTL_BIN" switch "$EXT_ONLY_PROFILE"
else
    # If eDP-1 is currently OFF, switch to Dual-Screen to turn it ON
    "$KANSHICTL_BIN" switch "$DUAL_PROFILE"
fi


# # Check if eDP-1 is currently ACTIVE
# if swaymsg -t get_outputs | jq -e '.[] | select(.name == "eDP-1" and .active == true)' > /dev/null; then
#     # If eDP-1 is currently ON, switch to External-Only to turn it OFF
#     kanshictl switch "$EXT_ONLY_PROFILE"
# else
#     # If eDP-1 is currently OFF, switch to Dual-Screen to turn it ON
#     kanshictl switch "$DUAL_PROFILE"
# fi

#!/bin/bash

# Profile names must match your kanshi config exactly
# DUAL_PROFILE="Dual-Screen"
# EXT_ONLY_PROFILE="External-Only"
#
# # Check if eDP-1 is currently active (enabled) in Sway's output engine
# if swaymsg -t get_outputs | jq -e '.[] | select(.name == "eDP-1" and .active == true)' > /dev/null; then
#     # If eDP-1 is active (ON), turn it off by switching to External-Only
#     kanshictl switch "$EXT_ONLY_PROFILE"
# else
#     # If eDP-1 is inactive (OFF), turn it on by switching to Dual-Screen
#     kanshictl switch "$DUAL_PROFILE"

# #!/bin/bash
#
# Profile names must match your kanshi config exactly
# DUAL_PROFILE="Dual-Screen"
# EXT_ONLY_PROFILE="External-Only"
#
# # Check if eDP-1 is disabled or inactive in Sway
# if swaymsg -t get_outputs | jq -e '.[] | select(.name == "eDP-1" and .active == false)' > /dev/null; then
#     # If eDP-1 is inactive, switch to Dual-Screen to turn it on
#     kanshictl switch "$DUAL_PROFILE"
# else
#     # If eDP-1 is active, switch to External-Only to turn it off
#     kanshictl switch "$EXT_ONLY_PROFILE"
# fi


# # Profile names must match your kanshi config exactly
# DUAL_PROFILE="Dual-Screen"
# EXT_ONLY_PROFILE="External-Only"
#
# # Check which profile is currently active via kanshictl status
# # Or check if eDP-1 is disabled in Hyprland
# if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
#     # If eDP-1 is off, switch to Dual-Screen
#     kanshictl switch "$DUAL_PROFILE"
# else
#     # If eDP-1 is on, switch to External-Only
#     kanshictl switch "$EXT_ONLY_PROFILE"
# fi

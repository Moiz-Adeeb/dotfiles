#!/bin/bash


#!/bin/bash

# Profile names must match your kanshi config exactly
DUAL_PROFILE="Dual-Screen"
EXT_ONLY_PROFILE="External-Only"

# Check which profile is currently active via kanshictl status
# Or check if eDP-1 is disabled in Hyprland
if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
    # If eDP-1 is off, switch to Dual-Screen
    kanshictl switch "$DUAL_PROFILE"
else
    # If eDP-1 is on, switch to External-Only
    kanshictl switch "$EXT_ONLY_PROFILE"
fi

# #!/bin/bash
# STATE_FILE="/tmp/hypr_internal_off"
# INTERNAL="eDP-1"
#
# toggle_internal() {
#     if [ -f "$STATE_FILE" ]; then
#         rm -f "$STATE_FILE"
#         # Force re-enable via Hyprland, then let Kanshi stabilize
#         hyprctl keyword monitor "$INTERNAL, 1920x1080@60, 0x0, 1.33"
#     else
#         touch "$STATE_FILE"
#         hyprctl keyword monitor "$INTERNAL, disable"
#     fi
#     # Tell Kanshi to refresh its state based on the current monitors
#     kanshictl reload
# }
#
# toggle_internal
#

#!/bin/bash
# # Check if eDP-1 is currently disabled
# if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
#     # Wake it up
#     hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1.33"
# else
#     # Kill it
#     hyprctl keyword monitor "eDP-1, disable"
# fi


# # Check if eDP-1 is currently disabled
# if hyprctl monitors all -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == true)' > /dev/null; then
#     # Wake it up
#     hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1.33"
# else
#     # Kill it
#     hyprctl keyword monitor "eDP-1, disable"
# fi


# STATE_FILE="/tmp/hypr_internal_off"
# INTERNAL="eDP-1"
# EXTERNAL="HDMI-A-1"
# INTERNAL_RES="1920x1080@60.02"
# EXTERNAL_RES="1920x1080@60.00"
# OFFSET="1920x0"
# INTERNAL_ONLY_SCALE=1.0
# INTERNAL_DUAL_SCREEN_SCALE=1.33
# EXTERNAL_SCREEN_SCALE=1.0
#
# apply_config() {
#     if hyprctl monitors all -j | jq -e ".[] | select(.name == \"$EXTERNAL\" and .disabled == false)" > /dev/null; then
#         #if hyprctl monitors -j | jq -e ".[] | select(.name == \"$INTERNAL\")" > /dev/null; then
#         if [ -f "$STATE_FILE" ]; then
#             hyprctl keyword monitor "$INTERNAL, disable"
#             hyprctl keyword monitor "$EXTERNAL, $EXTERNAL_RES, 0x0, $EXTERNAL_SCREEN_SCALE"
#         else
#             hyprctl keyword monitor "$INTERNAL, $INTERNAL_RES, 0x0, $INTERNAL_DUAL_SCREEN_SCALE"
#             hyprctl keyword monitor "$EXTERNAL, $EXTERNAL_RES, auto-right, $EXTERNAL_SCREEN_SCALE"
#             hyprctl dispatch dpms on "$INTERNAL"
#         fi
#     else
#         hyprctl keyword monitor "$INTERNAL, $INTERNAL_RES, 0x0, $INTERNAL_ONLY_SCALE"
#         hyprctl dispatch dpms on "$INTERNAL"
#         hyprctl dispatch focusmonitor "$INTERNAL"
#         #hyprctl reload
#         rm -f "$STATE_FILE"
#     fi
# }
#
# toggle_internal() {
#     if [ -f "$STATE_FILE" ]; then
#         rm -f "$STATE_FILE"
#     else
#         touch "$STATE_FILE"
#     fi
#     apply_config
# }
#
# if [[ "$1" == "toggle" ]]; then
#     toggle_internal
#     exit 0
# fi
#
#
# # apply_config
# # socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
# #     # if [[ $line == "monitoradded>>"* ]] || [[ $line == "monitorremoved>>"* ]]; then
# #     #     sleep 1
# #     #     apply_config
# #     # fi
# #     if [[ $line == "monitor"* ]] || [[ $line == "focusedmon"* ]]; then
# #         sleep 1
# #         apply_config
# #     fi
# # done
#
#
#
# # --- Initial run ---
# apply_config
#
# # --- Keep-Alive Event Listener ---
# while true; do
#     # Get the latest socket path
#     HYPR_SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
#
#     # Run socat and catch events
#     socat - "UNIX-CONNECT:$HYPR_SOCKET" | while read -r line; do
#         if [[ $line == *"monitoradded"* ]] || [[ $line == *"monitorremoved"* ]]; then
#             sleep 2
#             apply_config
#         fi
#     done
#
#     # If socat crashes/exits, wait 1 second and restart the loop
#     sleep 1
# done
#
#
# # # --- Event Listener ---
# # socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
# #     # Check if the line contains 'monitoradded' or 'monitorremoved'
# #     if [[ $line == *"monitoradded"* ]] || [[ $line == *"monitorremoved"* ]]; then
# #         # IMPORTANT: Wait a bit for Hyprland to finish internal state changes
# #         sleep 5 
# #         apply_config
# #     fi
# # done
# #
#
#
# handle() {
#   if hyprctl monitors all -j | jq -e ".[] | select(.name == \"$EXTERNAL\" and .disabled == false)" > /dev/null; then
#     hyprctl keyword monitor "$INTERNAL, disable"
#     hyprctl keyword monitor "$EXTERNAL, $EXTERNAL_RES, 0x0, $EXTERNAL_SCREEN_SCALE"
#   else
#     hyprctl keyword monitor "$INTERNAL, $INTERNAL_RES, 0x0, $INTERNAL_ONLY_SCALE"
#     rm -f "$STATE_FILE"
#   fi
# }
#


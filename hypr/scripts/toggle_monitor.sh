#!/bin/sh

#!/bin/bash
STATE_FILE="/tmp/hypr_internal_off"
INTERNAL="eDP-1"

toggle_internal() {
    if [ -f "$STATE_FILE" ]; then
        rm -f "$STATE_FILE"
        # Force re-enable via Hyprland, then let Kanshi stabilize
        hyprctl keyword monitor "$INTERNAL, 1920x1080@60, 0x0, 1.33"
    else
        touch "$STATE_FILE"
        hyprctl keyword monitor "$INTERNAL, disable"
    fi
    # Tell Kanshi to refresh its state based on the current monitors
    kanshictl reload
}

toggle_internal


# #!/bin/bash
#
# # Configuration Variables
# INTERNAL="eDP-1"
# EXTERNAL="HDMI-A-1"
# # Change 1920 to match your actual laptop width if it's different
# INTERNAL_RES="1920x1080@60.02"
# EXTERNAL_RES="1920x1080@60.00"
# OFFSET="1920x0"
#
# toggle_internal() {
#     if hyprctl monitors -j | jq -e ".[] | select(.name == \"$INTERNAL\")" > /dev/null; then
#         # Disable internal
#         hyprctl keyword monitor "$INTERNAL, disable"
#     else
#         # Re-enable internal on the LEFT (0x0)
#         hyprctl keyword monitor "$INTERNAL, $INTERNAL_RES, 0x0, 1"
#         # Ensure external is to the RIGHT (OFFSET)
#         hyprctl keyword monitor "$EXTERNAL, $EXTERNAL_RES, $OFFSET, 1"
#     fi
# }
#
# handle() {
#   # If External is connected and active
#   if hyprctl monitors all -j | jq -e ".[] | select(.name == \"$EXTERNAL\" and .disabled == false)" > /dev/null; then
#     hyprctl keyword monitor "$INTERNAL, disable"
#     # Ensure External moves to 0x0 when it's the only one (optional, helps focus)
#     hyprctl keyword monitor "$EXTERNAL, $EXTERNAL_RES, 0x0, 1"
#   else
#     # External gone? Internal back to 0x0
#     hyprctl keyword monitor "$INTERNAL, $INTERNAL_RES, 0x0, 1"
#   fi
# }
#
# # Keybind trigger: ./auto_monitor.sh toggle
# if [[ "$1" == "toggle" ]]; then
#     toggle_internal
#     exit 0
# fi
#
# # Startup/Hotplug logic
# handle
# socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
#     if [[ $line == "monitoradded>>"* ]] || [[ $line == "monitorremoved>>"* ]]; then
#         handle
#     fi
# done


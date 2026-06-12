#!/bin/sh

# 1. Handle Clicks
case $BLOCK_BUTTON in
    1) # Left Click: Launch impala-nm in background
       kitty --class=float_small -e ~/.cargo/bin/impala-nm > /dev/null 2>&1 &
       ;;
   3)
       status=$(nmcli -t radio wifi)

        if [ "$status" = "enabled" ]; then
            nmcli radio wifi off > /dev/null 2>&1
        else
            nmcli radio wifi on > /dev/null 2>&1
        fi

        pkill -RTMIN+4 i3blocks
        ;;
esac

# 2. Check Connection Status
# We check if an IP address exists for wireless interfaces
# if ip addr | grep -q "state UP" && ip addr | grep -q "wlan0\|wlp"; then
#     # CONNECTED: Yellow (Matches your F0C674)
#     echo "<span color='#F0C674'></span>"
# else
#     echo "<span color='#A54242'>⚠</span>"
# fi

if [ "$(nmcli -t -f WIFI radio)" = "disabled" ]; then
    echo "<span color='#707880'></span>" # Off icon (Gray)
elif ip addr | grep -q "state UP" && ip addr | grep -q "wlan0\|wlp"; then
    echo "<span color='#F0C674'></span>" # Connected (Yellow)
else
    echo "<span color='#A54242'>⚠</span>" # On but No IP (Red)
fi


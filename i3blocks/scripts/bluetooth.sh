#!/bin/sh

# 1. Handle Clicks
case $BLOCK_BUTTON in
    1) kitty --class=float_small -e bluetui & ;; # Add '&' to run in background
    3) # Right Click: Toggle Power
       if bluetoothctl show | grep -q "Powered: yes"; then
           bluetoothctl power off > /dev/null 2>&1
       else
           bluetoothctl power on > /dev/null 2>&1
       fi
       # Force the bar to update immediately after the change
       pkill -RTMIN+1 i3blocks
       ;;
esac

# 2. Output Status to Bar (The only text i3blocks should see)
if bluetoothctl show | grep -q "Powered: yes"; then
    if bluetoothctl info | grep -q "Connected: yes"; then
        echo "<span color='#89dceb'></span>"
    else
        echo "<span color='#6495ED'></span>"
    fi
else
    echo "<span color='#FFFFFF'></span>"
fi


#!/bin/sh
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STAT" = "Charging" ]; then
    echo "<span color='#00CF6B'> $BAT%</span>"
elif [ "$BAT" -le 20 ]; then
    echo "<span color='#B80000'>  $BAT%</span>"
elif [ "$BAT" -le 50 ]; then
    echo "<span color='#C2C738'>  $BAT%</span>"
else
    echo "<span color='#89dceb'></span>"
fi


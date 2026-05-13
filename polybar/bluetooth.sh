
#!/bin/bash

# Check if Bluetooth is powered on
if [ "$(bluetoothctl show | grep "Powered: yes" | wc -l)" -eq 0 ]; then
  echo "%{F#87CEEB}%{F-}" # Gray icon when off
  exit 0
fi

# Get the name of the connected device
DEVICE_INFO=$(bluetoothctl info)
DEVICE_NAME=$(bluetoothctl info | grep "Name:" | cut -d ' ' -f 2-)
BATTERY=$(echo "$DEVICE_INFO" | grep "Battery Percentage" | awk -F '[()]' '{print $2}')

if [ -n "$DEVICE_NAME" ]; then
  # Connected: Show icon (sky color) + Device Name
  echo "%{F#89dceb}%{F-}"
#  if [ -n "$BATTERY" ]; then
#    echo "%{F#89dceb}%{F-} $DEVICE_NAME|$BATTERY%|"
#  else
#    echo "%{F#89dceb}%{F-} $DEVICE_NAME"
#  fi
else
  # On but disconnected: Show icon (foreground color)
  echo "%{F#6495ED}%{F-}"
fi

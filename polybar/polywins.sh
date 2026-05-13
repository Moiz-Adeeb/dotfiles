#!/bin/bash

# Get windows from i3 and format as "Class:ID"
i3-msg -t get_tree | jq -r '
  recurse(.nodes[]) 

  | select(.window_properties.class != null) 
  | .window_properties.class + ":" + (.id | tostring)
' | while read -r line; do
    # Extract Class and ID
    CLASS=$(echo "$line" | cut -d':' -f1)
    ID=$(echo "$line" | cut -d':' -f2)

    # Convert to lowercase and capitalize first letter for a clean look
    LABEL=$(echo "$CLASS" | tr '[:upper:]' '[:lower:]' | sed 's/./\U&/')

    # Optional: Truncate very long names (e.g., "Gnome-terminal" -> "Gnome-term")
    LABEL_SHORT=$(echo "$LABEL" | cut -c 1-8)

    # Wrap in Polybar click action: A1 = Left Click
    echo -n "%{A1:i3-msg \"[con_id=$ID] focus\":} $LABEL_SHORT %{A} | "
done
echo ""


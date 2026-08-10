
#!/bin/bash
# Switches workspace when a tag is clicked, then forces Waybar to refresh
TAG_NUM=$1

# Try using wtype first (reliable for compositor actions)
if command -v wtype >/dev/null; then
    wtype -M logo "$TAG_NUM" -m logo
else
    # Fallback to wlrctl if wtype is missing
    wlrctl keyboard type "$TAG_NUM" modifiers SUPER
fi

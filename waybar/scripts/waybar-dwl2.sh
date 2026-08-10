
#!/bin/bash
# File: ~/.config/waybar/scripts/waybar-dwl2.sh

labels=("1" "2" "3" "4" "5", "6", "7", "8", "9")

# Pre-initialize paths
for i in {1..9}; do
    echo "{\"text\":\" ${labels[$((i-1))]} \",\"class\":[\"vacant\"]}" > "/dev/shm/dwl_tag_$i"
done

# Keep track of which monitor is currently focused (defaults to eDP-1)
active_monitor="eDP-1"

# Stream live updates from your UWSM dwl daemon logs
journalctl --user -b 0 -f -o cat | grep --line-buffered -E "selmon|tags" | while read -r line; do
    
    # 1. Track monitor focus switches
    if echo "$line" | grep -q "selmon 1"; then
        # If a monitor outputs "selmon 1", it means it just gained focus
        active_monitor=$(echo "$line" | awk '{print $1}')
        continue
    fi

    # 2. Parse tag layouts only if they come from the active monitor
    if echo "$line" | grep -q "tags"; then
        monitor=$(echo "$line" | awk '{print $1}')
        
        # If this log line belongs to the inactive background screen, ignore it!
        [ "$monitor" != "$active_monitor" ] && continue

        # Extract the four bitmask integers (e.g., "7 1 1 0")
        read -r _ _ selected focused occupied urgent <<< "$line"
        
        [ -z "$focused" ] && continue

        for i in {1..9}; do
            idx=$((i-1))
            icon="${labels[$idx]}"
            bit_val=$((1 << idx))

            if [ "$focused" -eq "$i" ]; then
                echo "{\"text\":\" $icon \",\"class\":[\"focused\"]}" > "/dev/shm/dwl_tag_$i"
            elif (( (occupied & bit_val) != 0 )); then
                echo "{\"text\":\" $icon \",\"class\":[\"occupied\"]}" > "/dev/shm/dwl_tag_$i"
            else
                echo "{\"text\":\" $icon \",\"class\":[\"vacant\"]}" > "/dev/shm/dwl_tag_$i"
            fi
        done

        # Tell Waybar to refresh immediately
        pkill -SIGRTMIN+1 waybar 2>/dev/null
    fi
done

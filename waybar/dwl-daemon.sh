
#!/bin/bash
# File: ~/.config/waybar/scripts/dwl-monitor-daemon.sh

# Initialize files so waybar doesn't display empty blocks on boot
for i in {1..9}; do
    echo '{"text":" '$i' ","class":["vacant"]}' > "/dev/shm/dwl_tag_$i"
done

tail -F "$HOME/.cache/dwltags" 2>/dev/null | while read -r line; do
    # Skip empty lines
    [ -z "$line" ] && continue

    for tag in {1..9}; do
        # Filter Check 1: Brackets indicate selection [3]
        if echo "$line" | grep -q "\[$tag\]"; then
            echo '{"text":" '"$tag"' ","class":["focused"]}' > "/dev/shm/dwl_tag_$tag"
            
        # Filter Check 2: Explicit seltag indicator
        elif echo "$line" | grep -q "seltag:$tag"; then
            echo '{"text":" '"$tag"' ","class":["focused"]}' > "/dev/shm/dwl_tag_$tag"
            
        # Filter Check 3: Check if tag is occupied (exists in line without brackets)
        elif echo "$line" | grep -q "\b$tag\b"; then
            echo '{"text":" '"$tag"' ","class":["occupied"]}' > "/dev/shm/dwl_tag_$tag"
            
        # Filter Check 4: Otherwise vacant
        else
            echo '{"text":" '"$tag"' ","class":["vacant"]}' > "/dev/shm/dwl_tag_$tag"
        fi
    done

    # Force Waybar to refresh its custom modules instantly
    pkill -SIGRTMIN+1 waybar 2>/dev/null
done
# #!/bin/bash
# # Background daemon: Put this in your autostart profile or service line
# tail -F "$HOME/.cache/dwltags" 2>/dev/null | while read -r line; do
#     # Simple example pattern: adjust based on your dwl output layout
#     for tag in {1..5}; do
#         if echo "$line" | grep -q "\[$tag\]"; then
#             echo "{\"text\":\" $tag \",\"class\":[\"focused\"]}" > "/dev/shm/dwl_tag_$tag"
#         elif echo "$line" | grep -q "\b$tag\b"; then
#             echo "{\"text\":\" $tag \",\"class\":[\"occupied\"]}" > "/dev/shm/dwl_tag_$tag"
#         else
#             echo "{\"text\":\" $tag \",\"class\":[\"vacant\"]}" > "/dev/shm/dwl_tag_$tag"
#         fi
#     done
#     pkill -SIGRTMIN+1 waybar 2>/dev/null
# done
#
# #
# #!/bin/bash
# # Persistent daemon that updates all tag files instantly
#
# # Ensure files exist initially so Waybar doesn't crash on startup
# for tag in {1..5}; do
#     echo '{"text":" '$tag' ","class":["vacant"]}' > "/dev/shm/dwl_tag_$tag"
# done
#
# tail -F "$HOME/.cache/dwltags" 2>/dev/null | while read -r line; do
#     # Extract the tag status string block (e.g., "tags: [1] 2 3 . . .")
#     # Clean up excess spaces for robust parsing
#     tags_string=$(echo "$line" | grep -o "tags:.*" | sed 's/tags://g')
#
#     for tag in {1..5}; do
#         # 1. Check if the tag is focused/selected: look for, [2], etc.
#         if echo "$tags_string" | grep -q "\[$tag\]"; then
#             echo '{"text":" '$tag' ","class":["focused"]}' > "/dev/shm/dwl_tag_$tag"
#
#         # 2. Check if the tag is occupied: look for a naked number without brackets
#         elif echo "$tags_string" | grep -q "\b$tag\b"; then
#             echo '{"text":" '$tag' ","class":["occupied"]}' > "/dev/shm/dwl_tag_$tag"
#
#         # 3. Otherwise, it is empty/vacant
#         else
#             echo '{"text":" '$tag' ","class":["vacant"]}' > "/dev/shm/dwl_tag_$tag"
#         fi
#     done
#
#     # Instantly trigger Waybar to redraw its custom elements
#     pkill -SIGRTMIN+1 waybar 2>/dev/null
# done

# #!/bin/bash
# # Persistent daemon that updates all tag files instantly without continuous polling loop overhead
#
# # 1. Listen to the dwl state output from your systemd or cache stream
# tail -F "$HOME/.cache/dwltags" 2>/dev/null | while read -r line; do
#     # 2. Extract active monitor tag context string patterns (adapt if your script logs differently)
#     # This quickly isolates what tags are focused or occupied and writes state instantly to shared RAM files
#     for tag in {1..5}; do
#         if echo "$line" | grep -q "seltag:$tag" || echo "$line" | grep -q "tags:.*\[$tag\]"; then
#             echo '{"text":" '$tag' ","class":["focused"]}' > "/dev/shm/dwl_tag_$tag"
#         elif echo "$line" | grep -q "tags:.*$tag"; then
#             echo '{"text":" '$tag' ","class":["occupied"]}' > "/dev/shm/dwl_tag_$tag"
#         else
#             echo '{"text":" '$tag' ","class":["vacant"]}' > "/dev/shm/dwl_tag_$tag"
#         fi
#     done
# done
#

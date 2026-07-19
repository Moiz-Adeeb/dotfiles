systemctl --user import-environment WAYLAND_DISPLAY XGD_CURRENT_DESKTOP &
systemctl --user start hyprland-session.target &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE 

# systemctl --user start bar &
# systemctl --user start mako &
# systemctl --user start kanshi &
# systemctl --user start foot-server &
# systemctl --user start swaybg 
# -i "$(cat /home/moiz/.background_wallpaper)" -m fill

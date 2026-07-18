local util = {
	status_bar = "waybar",
	clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
	lock = "hyprlock",
	screenshot = "hyprshot -m region",
	media = "playerctl",
	notification = "mako",
}

return util

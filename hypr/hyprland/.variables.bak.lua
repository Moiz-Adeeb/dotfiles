local x = {
	-- Configuration
	user = "moiz",
	uwsm = "uwsm app -- ",

	-- Main Keys
	super = "SUPER",
	shift = "SHIFT",
	ctrl = "CTRL",
	alt = "ALT",
	tab = "TAB",
	enter = "RETURN",
	space = "SPACE",
	esc = "ESCAPE",
	period = "PERIOD",
	semicolon = "SEMICOLON",
	extra_kb = "MUHENKAN",
	fn = "function",

	-- Window Sizes
	win = {
		ex_sm = "float_extra_small",
		sm = "float_small",
		bg = "float_big",
		lg = "float_large",
	},

	-- Direction Keys (Vim / Arrow)
	vim = {
		left = "H",
		right = "L",
		up = "K",
		down = "J",
	},
	arrow = {
		left = "LEFT",
		right = "RIGHT",
		up = "UP",
		down = "DOWN",
	},

	-- System Control Keys (Volume / Brightness)
	vol = {
		kb = "XF86Audio",
		mut = "pactl set-sink-mute @DEFAULT_SINK@ toggle",
		ctl = "pactl set-sink-volume @DEFAULT_SINK@",
		mic = {
			mut = "pactl set-source-mute @DEFAULT_SOURCE@ toggle",
		},
	},
	bright = {
		kb = "XF86MonBrightness",
		ctl = "brightnessctl set +5% && busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d",
	},
	sleep = "XF86Sleep"
}

-- Directories
x.dir = {
	user = "/home/" .. x.user,
	conf = "/home/" .. x.user .. "/.config/",
	hypr = "/home/" .. x.user .. "/.config/hypr/",
	scripts = "/home/" .. x.user .. "/.config/hypr/scripts/",
}

-- Mod Keys
x.mod = {
	x.super,
	shift = x.super .. " + " .. x.shift,
	ctrl = x.super .. " + " .. x.ctrl,
	enter = x.super .. " + " .. x.enter,
	alt = x.super .. " + " .. x.alt,
}

-- Rofi
x.menu = {
	app = "rofi -show drun -run-command '" .. x.uwsm .. "{cmd}'",
	power = x.dir.conf .. "rofi/powermenu/powermenu.sh",
}

-- Terminal
x.term = {
	app = "footclient",
	sh = "fish",
	mux = "tmux new-session",
	monitor = {
		default = 1,
		{
			id = "fastfetch",
			name = "Fastfetch",
			cmd = "fastfetch"
		},
		{
			id = "macchina",
			name = "Macchina",
			cmd = "macchina"
		},

	},
}

-- Utilities
x.util = {
	status_bar = "waybar",
	clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
	lock = "hyprlock",
	screenshot = "hyprshot -m region",
	media = "playerctl",
	notification = "mako",
}

-- Toggle
x.toggle = {
	wifi = "rfkill toggle wifi",
	bluetooth = "bluetoothctl show | grep -q 'Powered: yes' && bluetoothctl power off || bluetoothctl power on",
	audio = x.vol.mut,
	status_bar = "pkill -SIGUSR1 " .. x.util.status_bar,
}

return x

local key = {
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
	extra_kb = "MUHENKAN",

	-- Window Sizes
	window = {
		small = "float_small",
		big = "float_big",
		large = "float_large",
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
}

-- Directories
key.dir = {}
key.dir.user = "/home/" .. key.user
key.dir.config = key.dir.user .. "/.config/"
key.dir.hypr = key.dir.config .. "hypr/"
key.dir.scripts = key.dir.hypr .. "scripts/"

-- Mod Keys
key.mod = {
	key.super,
	shift = key.super .. " + " .. key.shift,
	ctrl = key.super .. " + " .. key.ctrl,
	enter = key.super .. " + " .. key.enter,
}

-- Rofi
key.menu = {
	app = "rofi -show drun -run-command '" .. key.uwsm .. "{cmd}'",
	power = key.dir.config .. "rofi/powermenu/powermenu.sh",
}

-- Terminal
key.term = {
	app = "footclient",
	shell = "fish",
	multiplexer = "tmux new-session",
	monitor = "fastfetch",
}

-- Applications
key.app = {
	editor = {
		nvim = "nvim",
		vim = "vim",
		nano = "nano",
	},
	network = key.term.app .. " -a " .. key.window.small .. " -e impala",
	bluetooth = key.term.app .. " -a " .. key.window.small .. " -e bluetui",
	audio = key.term.app .. " -a " .. key.window.small .. " -e wiremix",
	file_mgr = {
		yazi = key.term.app .. " -a " .. key.window.large .. " -e yazi",
		thunar = "thunar",
	},
	sys_monitor = {
		btop = key.term.app .. " -a " .. key.window.large .. " -e btop",
		htop = key.term.app .. " -a " .. key.window.large .. " -e htop",
		gtop = key.term.app .. " -a " .. key.window.large .. " -e gtop",
	},
	browser = {
		zen = "zen-browser",
		brave = "brave",
		chrome = "google-chrome-stable",
	},
}

-- Utilities
key.util = {
	bar = "waybar",
	clip = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
	lock = "hyprlock",
	snap = "hyprshot -m region",
	media = "playerctl",
	notification = "mako",
}
key.bar_toggle = "pkill -SIGUSR1 " .. key.util.bar

return key

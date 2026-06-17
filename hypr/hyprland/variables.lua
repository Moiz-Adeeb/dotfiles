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
		default = {
			id = "fastfetch",
			name = "Fastfetch",
			cmd = "fastfetch"
		},
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

-- Applications
x.app = {
	editor = {
		default = {
			id = "nvim",
			name = "Neovim",
			cmd = "nvim",
		},
		{
			id = "nvim",
			name = "Neovim",
			cmd = "nvim",
		},
		{
			id = "vim",
			name = "Vim",
			cmd = "vim",
		},
		{
			id = "nano",
			name = "Nano",
			cmd = "nano",
		},
	},
	network = {
		default = {
			id = "impala",
			name = "Impala",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e impala",
		},
		{
			id = "impala",
			name = "Impala",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e impala",
		},
		{
			id = "iwctl",
			name = "Iwd",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e iwctl",
		},
	},
	bluetooth = {
		default = {
			id = "bluetui",
			name = "Bluetui",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e bluetui",
		},
		{
			id = "bluetui",
			name = "Bluetui",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e bluetui",
		},
		{
			id = "bluetoothctl",
			name = "Bluetoothctl",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e bluetoothctl",
		},
	},
	audio = {
		default = {
			id = "wiremix",
			name = "Wiremix",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e wiremix",
		},
		{
			id = "wiremix",
			name = "Wiremix",
			cmd = x.term.app .. " -a " .. x.win.sm .. " -e wiremix",
		},
		{
			id = "pavucontrol",
			name = "Pavucontrol",
			cmd = "pavucontrol",
		}


	},
	file_mgr = {
		default = {
			id = "yazi",
			name = "Yazi",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e yazi",
		},
		{
			id = "yazi",
			name = "Yazi",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e yazi",
		},
		{
			id = "thunar",
			name = "Thunar",
			cmd = "thunar",
		},
	},
	sys_monitor = {
		default = {
			id = "btop",
			name = "Btop",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e btop",
		},
		{
			id = "btop",
			name = "Btop",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e btop",
		},
		{
			id = "htop",
			name = "Htop",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e htop",
		},
		{
			id = "gtop",
			name = "Gtop",
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e gtop",
		},
	},
	browser = {
		default = {
			id = "zen-browser",
			name = "Zen Browser",
			cmd = "zen-browser",
		},
		{
			id = "zen-browser",
			name = "Zen Browser",
			cmd = "zen-browser",
		},
		{
			id = "brave",
			name = "Brave Browser",
			cmd = "brave",
		},
		{
			id = "google-chrome-stable",
			name = "Google Chrome",
			cmd = "google-chrome-stable",
		},
		{
			id = "qutebrowser",
			name = "Qutebrowser",
			cmd = "qutebrowser",
		},
		{
			id = "chromium",
			name = "Chromium",
			cmd = "chromium",
		},
	},
}

-- Utilities
x.util = {
	bar = "waybar",
	clip = "cliphist list | rofi -dmenu | cliphist decode | wl-copy",
	lock = "hyprlock",
	snap = "hyprshot -m region",
	media = "playerctl",
	notification = "mako",
}
x.bar_toggle = "pkill -SIGUSR1 " .. x.util.bar

return x

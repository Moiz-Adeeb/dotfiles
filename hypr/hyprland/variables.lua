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
}

-- Directories
x.dir = {
	user = "/home/" .. x.user,
	conf = "/home/" .. x.user .. "/.config/",
	hypr = "/home/" .. x.user .. "/.config/hypr/",
	scripts = "/home/" .. x.user .. "/.config/hypr/scripts/",
}

-- Mod xs
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
	monitor = "fastfetch",
}

-- Applications
x.app = {
	editor = {
		default = {
			cmd = "nvim",
			name = "Neovim",
		},
		{
			cmd = "nvim",
			name = "Neovim",
		},
		{
			cmd = "vim",
			name = "Vim",
		},
		{
			cmd = "nano",
			name = "Nano",
		},
	},
	network = x.term.app .. " -a " .. x.win.sm .. " -e impala",
	bluetooth = x.term.app .. " -a " .. x.win.sm .. " -e bluetui",
	audio = x.term.app .. " -a " .. x.win.sm .. " -e wiremix",

	file_mgr = {
		default = {
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e yazi",
			name = "Yazi",
		},
		{
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e yazi",
			name = "Yazi",
		},
		{
			cmd = "thunar",
			name = "Thunar",
		},
	},
	sys_monitor = {
		default = {
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e btop",
			name = "Btop",
		},
		{
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e btop",
			name = "Btop",
		},
		{
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e htop",
			name = "Htop",
		},
		{
			cmd = x.term.app .. " -a " .. x.win.lg .. " -e gtop",
			name = "Gtop",
		},
	},
	browser = {
		default = {
			cmd = "zen-browser",
			name = "Zen Browser",
		},
		{
			cmd = "zen-browser",
			name = "Zen Browser",
		},
		{
			cmd = "brave",
			name = "Brave Browser",
		},
		{
			cmd = "google-chrome-stable",
			name = "Google Chrome",
		},
		{
			cmd = "qutebrowser",
			name = "Qute Browser",
		},
		{
			cmd = "chromium",
			name = "Chromium",
		},
	},
}
-- x.app.editor.default = x.app.editor.nvim
-- x.app.file_mgr.default = x.app.file_mgr.yazi
-- x.app.sys_monitor.default = x.app.sys_monitor.btop
-- x.app.browser.default = x.app.browser.zen

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

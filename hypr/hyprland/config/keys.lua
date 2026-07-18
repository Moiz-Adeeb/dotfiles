local mod = "SUPER"

local keys = {
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
	fn = "FUNCTION",
	print = "PRINT",

	mod = {
		mod,
		shift = mod .. " + SHIFT", --.. shift,
		ctrl = mod .. " + CTRL", --.. ctrl,
		enter = mod .. " + RETURN", --.. enter,
		alt = mod .. " + ALT", --.. alt,
	},

	-- Direction Keys (Vim / Arrow)
	---@type DirectionKeyset
	vim = {
		left = "H",
		right = "L",
		up = "K",
		down = "J",
	},
	---@type DirectionKeyset
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
	sleep = "XF86Sleep",
}

return keys, mod

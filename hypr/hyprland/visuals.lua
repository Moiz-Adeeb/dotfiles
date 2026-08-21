hl.config({
	general = {
		gaps_out = 8,
		gaps_in = 4,
		border_size = 2,

		col = {
			active_border = "rgb(33ccff)",
			-- active_border = { 
			-- 	colors = {
			-- 		"rgba(33ccffff)",
			-- 		"rgba(00ff99ff)",
			-- 	},
			-- 	angle = 45,
			-- },

			inactive_border = "rgb(c6a0f6)",
			-- inactive_border = { 
			-- 	colors = {
			-- 		"rgba(cba6f7ff)",
			-- 		"rgba(c6a0f6ff)",
			-- 	},
			-- 	angle = 135,
			-- },
		},

		resize_on_border = false,
		allow_tearing = true,
		layout = "master",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 10,
			-- ignore_opacity = false,
			new_optimizations = true,
			-- xray = false,
		},

		dim_inactive = false,
		dim_strength = 0.25,
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_status = "slave",
		mfact = 0.5,
	},
})
hl.animation({ leaf = "global", enabled = false })

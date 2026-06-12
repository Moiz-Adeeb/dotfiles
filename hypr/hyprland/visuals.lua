hl.config({
	general = {
		gaps_out = 6,
		gaps_in = 2,
		border_size = 2,

		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)",
					--"rgba(cba6f7dd)",
				},
				angle = 180,
			},

			inactive_border = {
				colors = {
					"rgba(cba6f7aa)",
					"rgba(c6a0f6aa)",
				},
				angle = 135,
			},
		},

		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1,
		inactive_opacity = 1,
		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
			size = 10,
			passes = 0,
			ignore_opacity = false,
			new_optimizations = true,
			xray = false,
		},

		dim_inactive = false,
		dim_strength = 0.05,
	},

	animations = {
		enabled = false,
		bezier = {
			"linear, 0.0, 0.0, 1.0, 1.0",
			"instantOut, 0.0, 1.0, 0.1, 1.0",
			"snapFast, 0.25, 1.0, 0.25, 1.0",
		},

		animation = {
			"global, 1, 2, snapFast",
			"border, 1, 1, linear",
			"windows, 1, 2, instantOut, slide",
			"windowsIn, 1, 2, instantOut, slide",
			"windowsOut, 1, 1.5, linear, popin 80%",
			"fadeIn, 1, 1.5, linear",
			"fadeOut, 1, 1, linear",
			"fade, 1, 1.5, linear",
			"layers, 1, 2, snapFast, fade",
			"layersIn, 1, 2, snapFast, fade",
			"layersOut, 1, 1.5, linear, fade",
			"fadeLayersIn, 1, 1.5, linear",
			"fadeLayersOut, 1, 1, linear",
			"workspaces, 1, 2.2, snapFast, slidefade 10%",
			"workspacesIn, 1, 2.2, snapFast, slidefade 10%",
			"workspacesOut, 1, 1.5, linear, fade",
			"zoomFactor, 1, 2, instantOut",
		},
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_status = "slave",
		mfact = 0.55,
	},
})

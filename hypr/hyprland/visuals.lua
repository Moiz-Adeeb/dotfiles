hl.config({
	general = {
		gaps_out = 0,
		gaps_in = 0,
		border_size = 2,

		col = {
			active_border = "rgb(33ccff)", --{
			-- 	colors = {
			-- 		"rgba(33ccffff)",
			-- 		"rgba(00ff99ff)",
			-- 	},
			-- 	angle = 45,
			-- },

			inactive_border = "rgb(595959)", --{
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
		rounding = 0,
		rounding_power = 0,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
			-- size = 0,
			-- passes = 0,
			-- ignore_opacity = false,
			-- new_optimizations = true,
			-- xray = false,
		},

		dim_inactive = false,
		dim_strength = 0.25,
	},

	animations = {
		enabled = false,
		-- bezier = {
		-- 	"linear, 0.0, 0.0, 1.0, 1.0",
		-- 	"instantOut, 0.0, 1.0, 0.1, 1.0",
		-- 	"snapFast, 0.25, 1.0, 0.25, 1.0",
		-- },
		--
		-- animation = {
		-- 	"global, 1, 2, snapFast",
		-- 	"border, 1, 1, linear",
		-- 	"windows, 1, 2, instantOut, slide",
		-- 	"windowsIn, 1, 2, instantOut, slide",
		-- 	"windowsOut, 1, 1.5, linear, popin 80%",
		-- 	"fadeIn, 1, 1.5, linear",
		-- 	"fadeOut, 1, 1, linear",
		-- 	"fade, 1, 1.5, linear",
		-- 	"layers, 1, 2, snapFast, fade",
		-- 	"layersIn, 1, 2, snapFast, fade",
		-- 	"layersOut, 1, 1.5, linear, fade",
		-- 	"fadeLayersIn, 1, 1.5, linear",
		-- 	"fadeLayersOut, 1, 1, linear",
		-- 	"workspaces, 1, 2.2, snapFast, slidefade 10%",
		-- 	"workspacesIn, 1, 2.2, snapFast, slidefade 10%",
		-- 	"workspacesOut, 1, 1.5, linear, fade",
		-- 	"zoomFactor, 1, 2, instantOut",
		-- },
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

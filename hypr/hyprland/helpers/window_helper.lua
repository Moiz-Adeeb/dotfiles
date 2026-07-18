local keys = require("hyprland.config.keys")

local window_helper = {}
-----------------------
-- Window Management --
-----------------------
-- Manage Windows
---@param direction_keyset DirectionKeyset
function window_helper.window_management(direction_keyset)
	-- Focus to Window in Direction
	hl.bind(keys.mod[1] .. " + " .. direction_keyset.left, hl.dsp.focus({ direction = "left" }), { repeating = true })
	hl.bind(keys.mod[1] .. " + " .. direction_keyset.right, hl.dsp.focus({ direction = "right" }), { repeating = true })
	hl.bind(keys.mod[1] .. " + " .. direction_keyset.up, hl.dsp.focus({ direction = "up" }), { repeating = true })
	hl.bind(keys.mod[1] .. " + " .. direction_keyset.down, hl.dsp.focus({ direction = "down" }), { repeating = true })

	-- Move Window in Direction
	hl.bind(
		keys.mod.shift .. " + " .. direction_keyset.left,
		hl.dsp.window.move({ direction = "left" }),
		{ repeating = true }
	)
	hl.bind(
		keys.mod.shift .. " + " .. direction_keyset.right,
		hl.dsp.window.move({ direction = "right" }),
		{ repeating = true }
	)
	hl.bind(
		keys.mod.shift .. " + " .. direction_keyset.up,
		hl.dsp.window.move({ direction = "up" }),
		{ repeating = true }
	)
	hl.bind(
		keys.mod.shift .. " + " .. direction_keyset.down,
		hl.dsp.window.move({ direction = "down" }),
		{ repeating = true }
	)
end

-- Resize Windows
---@param direction_keyset DirectionKeyset
function window_helper.resize_window(direction_keyset)
	hl.bind(direction_keyset.left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind(direction_keyset.right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind(direction_keyset.up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind(direction_keyset.down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
end

return window_helper

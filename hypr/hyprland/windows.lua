local keys = require("hyprland.config.keys")
local window_helper = require("hyprland.helpers.window_helper")

-------------
-- WINDOWS --
-------------
-- Control Windows
window_helper.window_management(keys.arrow)
window_helper.window_management(keys.vim)

-- Layout, Floating & Fullscreen Controls
hl.bind(keys.mod[1] .. " + W", hl.dsp.group.toggle())
hl.bind(keys.mod[1] .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("F11", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(keys.mod[1] .. " + " .. keys.space, hl.dsp.window.float({ action = "toggle" }), { repeating = true })

-- Cycle Focus on Windows
hl.bind(keys.alt .. " + " .. keys.tab, hl.dsp.window.cycle_next({ visible = true, prev = true }), { repeating = true })
hl.bind(keys.alt .. " + " .. keys.shift .. " + " .. keys.tab, hl.dsp.window.cycle_next({ historical = true }), { repeating = true })
-- hl.bind("ALT + TAB", hl.dsp.layout("cyclenext loop"))

--------------------
-- RESIZE SUBMAP  --
--------------------
hl.bind(keys.mod[1] .. " + R", hl.dsp.submap("Resize"))
hl.define_submap("Resize", function()
	-- Resize Windows
	window_helper.resize_window(keys.arrow)
	window_helper.resize_window(keys.vim)

	-- Use Reset to go Back to the Global Submap
	hl.bind("R", hl.dsp.submap("reset"))
	hl.bind(keys.esc, hl.dsp.submap("reset"))
	hl.bind(keys.enter, hl.dsp.submap("reset"))
end)

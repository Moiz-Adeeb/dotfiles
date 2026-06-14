local x = require("hyprland.variables")
-------------
-- WINDOWS --
-------------
-- Move Focus with Arrow Keys
hl.bind(x.mod[1] .. " + " .. x.arrow.left, hl.dsp.focus({ direction = "left" }))
hl.bind(x.mod[1] .. " + " .. x.arrow.right, hl.dsp.focus({ direction = "right" }))
hl.bind(x.mod[1] .. " + " .. x.arrow.up, hl.dsp.focus({ direction = "up" }))
hl.bind(x.mod[1] .. " + " .. x.arrow.down, hl.dsp.focus({ direction = "down" }))

-- Move Focus with Vim Keys (HJKL)
hl.bind(x.mod[1] .. " + " .. x.vim.left, hl.dsp.focus({ direction = "left" }))
hl.bind(x.mod[1] .. " + " .. x.vim.right, hl.dsp.focus({ direction = "right" }))
hl.bind(x.mod[1] .. " + " .. x.vim.up, hl.dsp.focus({ direction = "up" }))
hl.bind(x.mod[1] .. " + " .. x.vim.down, hl.dsp.focus({ direction = "down" }))

-- Move Window with Arrow Keys (Uses hl.dsp.window.move table syntax)
hl.bind(x.mod.shift .. " + " .. x.arrow.left, hl.dsp.window.move({ direction = "left" }))
hl.bind(x.mod.shift .. " + " .. x.arrow.right, hl.dsp.window.move({ direction = "right" }))
hl.bind(x.mod.shift .. " + " .. x.arrow.up, hl.dsp.window.move({ direction = "up" }))
hl.bind(x.mod.shift .. " + " .. x.arrow.down, hl.dsp.window.move({ direction = "down" }))

-- Move Window with Vim Keys (HJKL)
hl.bind(x.mod.shift .. " + " .. x.vim.left, hl.dsp.window.move({ direction = "left" }))
hl.bind(x.mod.shift .. " + " .. x.vim.down, hl.dsp.window.move({ direction = "down" }))
hl.bind(x.mod.shift .. " + " .. x.vim.up, hl.dsp.window.move({ direction = "up" }))
hl.bind(x.mod.shift .. " + " .. x.vim.right, hl.dsp.window.move({ direction = "right" }))

-- Layout, Floating & Fullscreen Controls
hl.bind(x.mod[1] .. " + W", hl.dsp.group.toggle())
hl.bind(x.mod[1] .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("F11", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(x.mod[1] .. " + " .. x.space, hl.dsp.window.float({ action = "toggle" }))
hl.bind(x.mod.shift .. " + " .. x.space, hl.dsp.focus({ last = true }))

-- Cycle Focus (Alt+Tab)
hl.bind(x.alt .. " + " .. x.tab, hl.dsp.focus({ direction = "right" }))
hl.bind(x.alt .. " + SHIFT + " .. x.tab, hl.dsp.focus({ direction = "left" }))

--------------------
-- RESIZE SUBMAP  --
--------------------
-- Enter the Resize Submap
hl.bind(x.mod[1] .. " + R", hl.dsp.submap("resize"))

-- Define the Submap Namespace
hl.define_submap("resize", function()
	-- Resize with Arrow Keys - Repeating
	hl.bind(x.arrow.right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind(x.arrow.left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind(x.arrow.up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind(x.arrow.down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Resize with Vim Keys (HJKL) - Repeating
	hl.bind(x.vim.right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind(x.vim.left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind(x.vim.up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind(x.vim.down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use Reset to go Back to the Global Submap
	hl.bind("R", hl.dsp.submap("reset"))
	hl.bind(x.esc, hl.dsp.submap("reset"))
	hl.bind(x.enter, hl.dsp.submap("reset"))
end)

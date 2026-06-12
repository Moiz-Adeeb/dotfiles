local key = require("hyprland.variables")
-------------
-- WINDOWS --
-------------
-- Move focus with Arrow Keys
hl.bind(key.mod[1] .. " + " .. key.arrow.left, hl.dsp.focus({ direction = "left" }))
hl.bind(key.mod[1] .. " + " .. key.arrow.right, hl.dsp.focus({ direction = "right" }))
hl.bind(key.mod[1] .. " + " .. key.arrow.up, hl.dsp.focus({ direction = "up" }))
hl.bind(key.mod[1] .. " + " .. key.arrow.down, hl.dsp.focus({ direction = "down" }))

-- Move focus with Vim Keys (HJKL)
hl.bind(key.mod[1] .. " + " .. key.vim.left, hl.dsp.focus({ direction = "left" }))
hl.bind(key.mod[1] .. " + " .. key.vim.right, hl.dsp.focus({ direction = "right" }))
hl.bind(key.mod[1] .. " + " .. key.vim.up, hl.dsp.focus({ direction = "up" }))
hl.bind(key.mod[1] .. " + " .. key.vim.down, hl.dsp.focus({ direction = "down" }))

-- Move Window with Arrow Keys (Uses hl.dsp.window.move table syntax)
hl.bind(key.mod.shift .. " + " .. key.arrow.left, hl.dsp.window.move({ direction = "left" }))
hl.bind(key.mod.shift .. " + " .. key.arrow.right, hl.dsp.window.move({ direction = "right" }))
hl.bind(key.mod.shift .. " + " .. key.arrow.up, hl.dsp.window.move({ direction = "up" }))
hl.bind(key.mod.shift .. " + " .. key.arrow.down, hl.dsp.window.move({ direction = "down" }))

-- Move Window with Vim Keys (HJKL)
hl.bind(key.mod.shift .. " + " .. key.vim.left, hl.dsp.window.move({ direction = "left" }))
hl.bind(key.mod.shift .. " + " .. key.vim.down, hl.dsp.window.move({ direction = "down" }))
hl.bind(key.mod.shift .. " + " .. key.vim.up, hl.dsp.window.move({ direction = "up" }))
hl.bind(key.mod.shift .. " + " .. key.vim.right, hl.dsp.window.move({ direction = "right" }))

-- Layout, Floating & Fullscreen Controls
hl.bind(key.mod[1] .. " + W", hl.dsp.group.toggle())
hl.bind(key.mod[1] .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("F11", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(key.mod[1] .. " + " .. key.space, hl.dsp.window.float({ action = "toggle" }))
hl.bind(key.mod.shift .. " + " .. key.space, hl.dsp.focus({ last = true }))

-- Cycle Focus (Alt+Tab)
hl.bind(key.alt .. " + " .. key.tab, hl.dsp.focus({ direction = "right" }))
hl.bind(key.alt .. " + SHIFT + " .. key.tab, hl.dsp.focus({ direction = "left" }))

--------------------
-- RESIZE SUBMAP  --
--------------------
-- Enter the resize submap
hl.bind(key.mod[1] .. " + R", hl.dsp.submap("resize"))

-- Define the submap namespace
hl.define_submap("resize", function()
	-- Resize with Arrow Keys - Repeating
	hl.bind(key.arrow.right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind(key.arrow.left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind(key.arrow.up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind(key.arrow.down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Resize with Vim Keys (HJKL) - Repeating
	hl.bind(key.vim.right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind(key.vim.left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind(key.vim.up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind(key.vim.down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("R", hl.dsp.submap("reset"))
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)

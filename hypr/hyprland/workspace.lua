local keys = require("hyprland.config.keys")
----------------
-- WORKSPACE  --
----------------
-- Cycle Workspaces
-- hl.bind(keys.mod[1] .. " + " .. keys.tab, hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind(keys.mod[1] .. " + " .. keys.tab, hl.dsp.focus({ workspace = "previous" }), { repeating = false })
hl.bind(keys.mod[1] .. " + " .. keys.shift .. "+" .. keys.tab, hl.dsp.focus({ workspace = "e-1" }), { repeating = true })

hl.bind(keys.mod[1] .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(keys.mod[1] .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Jump to / Move to the New & Empty Workspace
hl.bind(keys.mod[1] .. " + T", hl.dsp.focus({ workspace = "empty" }))
hl.bind(keys.mod.shift .. " + T", hl.dsp.window.move({ workspace = "empty" }))

hl.bind(keys.mod[1] .. " + mouse:274", hl.dsp.focus({ workspace = "empty" }))
hl.bind(keys.mod.shift .. " + mouse:274", hl.dsp.window.move({ workspace = "empty" }))

-- Jump to / Move to the Num Workspace
for i = 1, 10 do
	local num = i % 10
	hl.bind(keys.mod[1] .. " + " .. num, hl.dsp.focus({ workspace = i }))
	hl.bind(keys.mod.shift .. " + " .. num, hl.dsp.window.move({ workspace = i }))
end

-- Special Workspace
hl.bind(keys.mod[1] .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(keys.mod.shift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move / Resize Windows
hl.bind(keys.mod[1] .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(keys.mod[1] .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

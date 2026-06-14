local x = require("hyprland.variables")
----------------
-- WORKSPACE  --
----------------
-- Cycle Tab (Workspace Next / Prev)
hl.bind(x.mod[1] .. " + " .. x.tab, hl.dsp.focus({ workspace = "e+1" }))
hl.bind(x.mod[1] .. " + " .. x.shift .. "+" .. x.tab, hl.dsp.focus({ workspace = "e-1" }))

-- Jump to / Move to the Next Empty Workspace
hl.bind(x.mod[1] .. " + T", hl.dsp.focus({ workspace = "empty" }))
hl.bind(x.mod.shift .. " + T", hl.dsp.window.move({ workspace = "empty" }))

hl.bind(x.mod[1] .. " + mouse:274", hl.dsp.focus({ workspace = "empty" }))
hl.bind(x.mod.shift .. " + mouse:274", hl.dsp.window.move({ workspace = "empty" }))

-- Jump to / Move to the Num Workspace
for i = 1, 10 do
	local num = i % 10
	hl.bind(x.mod[1] .. " + " .. num, hl.dsp.focus({ workspace = i }))
	hl.bind(x.mod.shift .. " + " .. num, hl.dsp.window.move({ workspace = i }))
end

-- Special Workspace
hl.bind(x.mod[1] .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(x.mod.shift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll Through Existing Workspaces
hl.bind(x.mod[1] .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(x.mod[1] .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move / Resize Windows
hl.bind(x.mod[1] .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(x.mod[1] .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

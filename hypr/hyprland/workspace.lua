local key = require("hyprland.variables")
----------------
-- WORKSPACE  --
----------------
-- Cycle Tab (Workspace next/prev)
hl.bind(key.mod[1] .. " + " .. key.tab, hl.dsp.focus({ workspace = "e+1" }))
hl.bind(key.mod[1] .. " + " .. key.shift .. "+" .. key.tab, hl.dsp.focus({ workspace = "e-1" }))

-- Jump to / Move to the next "Empty" workspace natively
hl.bind(key.mod[1] .. " + T", hl.dsp.focus({ workspace = "empty" }))
hl.bind(key.mod.shift .. " + T", hl.dsp.window.move({ workspace = "empty" }))

hl.bind(key.mod[1] .. " + mouse:274", hl.dsp.focus({ workspace = "empty" }))
hl.bind(key.mod.shift .. " + mouse:274", hl.dsp.window.move({ workspace = "empty" }))

for i = 1, 10 do
	local num = i % 10
	hl.bind(key.mod[1] .. " + " .. num, hl.dsp.focus({ workspace = i }))
	hl.bind(key.mod.shift .. " + " .. num, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(key.mod[1] .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(key.mod.shift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(key.mod[1] .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(key.mod[1] .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(key.mod[1] .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(key.mod[1] .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

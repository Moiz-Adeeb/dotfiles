local keys = require("hyprland.config.keys")
local term = require("hyprland.config.term")
local misc = require("hyprland.config.misc")

local keybind_helper = {}
------------------------------------------------------------
-- Application Type Submap & Default Application Shortcut --
------------------------------------------------------------
-- Application Shortcut Binding
---@param shortcut string
---@param application_type AppList
---@param submap_name string
function keybind_helper.app_bind(shortcut, application_type, submap_name)
	hl.bind(keys.mod[1] .. " + " .. shortcut, hl.dsp.exec_cmd(application_type[application_type.default].cmd))
	if application_type.toggle ~= nil then
		hl.bind(keys.mod.ctrl .. " + " .. shortcut, hl.dsp.exec_cmd(application_type.toggle))
	end
	hl.bind(keys.mod.shift .. " + " .. shortcut, function()
		keybind_helper.show_popup(application_type)
		hl.dispatch(hl.dsp.submap(submap_name))
	end)
	hl.define_submap(submap_name, function()
		keybind_helper.open_application(application_type)
	end)
end

-- Show Application Selection Window
---@param application_type AppList
function keybind_helper.show_popup(application_type)
	local msg = "\n\t     KEYBINDINGS\n\n"
	msg = msg .. string.format(" [SPACE] Default  -  %s \n\n", application_type[application_type.default].name, "\n")
	for i = 1, #application_type do
		local application_index = i % 10
		msg = msg .. string.format(" [%d]  -  %s\n", application_index, application_type[i].name)
	end
	msg = msg .. "\n [ESC / ENTER]  ->  Cancel"
	local cmd = string.format(
		misc.uwsm
			.. term.app
			.. [[ -o colors-dark.background=002b36				]] --- Terminal Background Color
			.. [[ -o colors-dark.foreground=FFFFFF				]] --- Terminal Foreground Color
			.. [[ -o colors-dark.alpha=0.9						]] --- Terminal Background Opacity
			.. [[ --title popup									]] --- Terminal Window Title
			.. [[ -a "%s" bash -c "echo -e \"%s\"; read -n 1"	]], -- Startup Command
		misc.win.ex_sm,
		msg
	)
	hl.dispatch(hl.dsp.exec_cmd(cmd))
end

-- Open Selected Application From Submap
---@param application_type AppList
function keybind_helper.open_application(application_type)
	for i = 1, #application_type do
		local num = i % 10
		hl.bind(num, function()
			hl.dispatch(hl.dsp.exec_cmd(misc.uwsm .. application_type[num].cmd))
			keybind_helper.close_submap()
		end)
	end
	hl.bind(keys.space, function()
		hl.dispatch(hl.dsp.exec_cmd(misc.uwsm .. application_type[application_type.default].cmd))
		keybind_helper.close_submap()
	end)
	hl.bind("catchall", function()
		keybind_helper.close_submap()
	end)
end

-- Close Open Submap
function keybind_helper.close_submap()
	hl.dispatch(hl.dsp.exec_cmd("pkill -f popup"))
	hl.dispatch(hl.dsp.submap("reset"))
end

return keybind_helper

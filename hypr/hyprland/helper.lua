local x = require("hyprland.variables")
local helper = {}

function helper.close_submap()
	hl.dispatch(hl.dsp.exec_cmd("pkill -f popup"))
	hl.dispatch(hl.dsp.submap("reset"))
end

function helper.show_popup(application_list)
	local msg = "\n\t     KEYBINDINGS\n\n"
	msg = msg .. string.format(" [SPACE] Default  -  %s \n\n", application_list.default.name, "\n")
	for i = 1, #application_list do
		local num = i % 10
		msg = msg .. string.format(" [%d]  -  %s\n", num, application_list[i].name)
	end
	msg = msg .. "\n [ESC / ENTER]  ->  Cancel"
	local cmd = string.format(
		x.term.app .. [[ -o colors-dark.background=002b36 -o colors-dark.alpha=0.9 --title popup -a "%s" bash -c "echo -e \"%s\"; read -n 1"]],
		x.win.ex_sm,
		msg
	)

	hl.dispatch(hl.dsp.exec_cmd(cmd))
end

function helper.open_application(application_list)
	for i = 1, #application_list do
		local num = i % 10
		hl.bind(num, function()
			hl.dispatch(hl.dsp.exec_cmd(x.uwsm .. application_list[num].cmd))
			helper.close_submap()
		end)
	end

	hl.bind(x.space, function()
		hl.dispatch(hl.dsp.exec_cmd(x.uwsm .. application_list.default.cmd))
		helper.close_submap()
	end)
	hl.bind("catchall", function()
		helper.close_submap()
	end)
end

function helper.app_bind(shortcut, application_type, submap_name)
	hl.bind(x.mod[1] .. " + " .. shortcut, hl.dsp.exec_cmd(application_type.default.cmd))
	hl.bind(x.mod.shift .. " + " .. shortcut, function()
		helper.show_popup(application_type)
		hl.dispatch(hl.dsp.submap(submap_name))
	end)
	hl.define_submap(submap_name, function()
		helper.open_application(application_type)
	end)
end

return helper

-- hl.dispatch(hl.dsp.exec_cmd("pkill -f popup"))
-- hl.dispatch(hl.dsp.submap("reset"))

-- hl.bind("catchall", function()
-- 	hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
-- 	hl.dispatch(hl.dsp.exec_cmd("pkill -f popup"))
-- 	hl.dispatch(hl.dsp.submap("reset"))
-- end)

-- hl.bind(x.mod.shift .. " + E", function()
-- 	helper.show_popup(x.app.file_mgr)
-- 	hl.dispatch(hl.dsp.submap("File Manager"))
-- end)
-- hl.define_submap("File Manager", function()
-- 	helper.open_application(x.app.file_mgr)
-- end)

-- hl.bind(x.mod.shift .. " + ESCAPE", function()
-- 	helper.show_popup(x.app.sys_monitor)
-- 	hl.dispatch(hl.dsp.submap("System Monitor"))
-- end)
-- hl.define_submap("System Monitor", function()
-- 	helper.open_application(x.app.sys_monitor)
-- end)

-- hl.bind(x.mod.shift .. " + O", function()
-- 	helper.show_popup(x.app.browser)
-- 	hl.dispatch(hl.dsp.submap("browsers"))
-- end)
-- hl.define_submap("browsers", function()
-- 	helper.open_application(x.app.browser)
-- end)

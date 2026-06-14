local x = require("hyprland.variables")
local helper = require("hyprland.helper")

--------------
-- KEYBINDS --
--------------
-- Terminal
hl.bind(
	x.mod.ctrl .. " + " .. x.enter,
	hl.dsp.exec_cmd(x.uwsm .. x.term.app .. " -a " .. x.win.lg .. " -e " .. x.term.sh .. " -C " .. x.term.monitor)
)
hl.bind(
	x.mod.enter,
	hl.dsp.exec_cmd(x.uwsm .. x.term.app .. " -a " .. x.win.sm .. " -e " .. x.term.sh .. " -C " .. x.term.monitor)
)
hl.bind(x.mod.shift .. " + " .. x.enter, hl.dsp.exec_cmd(x.uwsm .. x.term.app))
hl.bind(
	x.alt .. " + PERIOD",
	hl.dsp.exec_cmd(
		x.uwsm
			.. x.term.app
			.. ' -e sh -c "'
			.. x.term.mux
			.. " '"
			.. x.app.editor.default.cmd
			.. " "
			.. x.dir.conf
			.. [['"]]
	)
)

------------------------------------------
-- Core Operations & Window Dispatchers --
------------------------------------------
-- File Manager
hl.bind(x.mod[1] .. " + E", hl.dsp.exec_cmd(x.uwsm .. x.app.file_mgr.default.cmd))
helper.submap("E", x.app.file_mgr, "File Manager")

-- System Monitor
hl.bind(x.mod[1] .. " + " .. x.esc, hl.dsp.exec_cmd(x.uwsm .. x.app.sys_monitor.default.cmd))
helper.submap(x.esc, x.app.sys_monitor, "System Monitor")

-- Browser
hl.bind(x.mod[1] .. " + O", hl.dsp.exec_cmd(x.uwsm .. x.app.browser.default.cmd))
helper.submap("O", x.app.browser, "Browser")

-- Application Menu
for _, key in ipairs({
	x.mod[1] .. " + D",
	x.alt .. " + " .. x.space,
}) do
	hl.bind(key, hl.dsp.exec_cmd(x.uwsm .. x.menu.app))
end
hl.bind(x.mod[1] .. " + P", hl.dsp.exec_cmd(x.uwsm .. x.menu.power))

-- Close Window
for _, key in ipairs({
	x.mod[1] .. " + X",
	x.alt .. " + F4",
	x.mod.shift .. " + Q",
}) do
	hl.bind(key, hl.dsp.window.close())
end

-- hl.bind(x.mod[1] .. " + D", hl.dsp.exec_cmd(x.uwsm .. x.menu.app))
-- hl.bind(x.alt .. " + " .. x.space, hl.dsp.exec_cmd(x.uwsm .. x.menu.app))

-- hl.bind(x.mod[1] .. " + X", hl.dsp.window.close())
-- hl.bind(x.alt .. " + F4", hl.dsp.window.close())
-- hl.bind(x.mod.shift .. " + Q", hl.dsp.window.close())

hl.bind(x.mod.ctrl .. " + L", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(x.mod.ctrl .. " + E", hl.dsp.exit())

-- Network / Bluetooth / Audio
hl.bind(x.mod.shift .. " + I", hl.dsp.exec_cmd(x.uwsm .. x.app.network))
hl.bind(x.mod.shift .. " + M", hl.dsp.exec_cmd(x.uwsm .. x.app.bluetooth))
hl.bind(x.mod.shift .. " + W", hl.dsp.exec_cmd(x.uwsm .. x.app.audio))

-- Audio Control
hl.bind(x.vol.kb .. "RaiseVolume", hl.dsp.exec_cmd(x.vol.ctl .. " +5%"), { repeating = true })
hl.bind(x.vol.kb .. "LowerVolume", hl.dsp.exec_cmd(x.vol.ctl .. " -5%"), { repeating = true })
hl.bind(x.vol.kb .. "Mute", hl.dsp.exec_cmd(x.vol.mut), { repeating = true })
hl.bind(x.vol.kb .. "MicMute", hl.dsp.exec_cmd(x.vol.mic.mut), { repeating = true })

-- Brightness Control
hl.bind(x.bright.kb .. "Up", hl.dsp.exec_cmd(x.bright.ctl .. " +0.05"), { repeating = true })
hl.bind(x.bright.kb .. "Down", hl.dsp.exec_cmd(x.bright.ctl .. " -0.05"), { repeating = true })

-- Media Controls
hl.bind(x.vol.kb .. "Next", hl.dsp.exec_cmd(x.util.media .. " next"), { repeating = true })
hl.bind(x.vol.kb .. "Pause", hl.dsp.exec_cmd(x.util.media .. " play-pause"), { repeating = true })
hl.bind(x.vol.kb .. "Play", hl.dsp.exec_cmd(x.util.media .. " play-pause"), { repeating = true })
hl.bind(x.vol.kb .. "Prev", hl.dsp.exec_cmd(x.util.media .. " previous"), { repeating = true })

-- System Services & Scripts
hl.bind(x.mod.shift .. " + Z", hl.dsp.exec_cmd("systemctl --user restart foot-server"))
hl.bind(x.mod[1] .. " + B", hl.dsp.exec_cmd(x.bar_toggle))
hl.bind(x.mod.shift .. " + B", hl.dsp.exec_cmd(x.uwsm .. "systemctl --user restart bar"))
hl.bind(
	x.mod.ctrl .. " + B",
	hl.dsp.exec_cmd("systemctl --user is-active --quiet bar && systemctl --user stop bar || systemctl --user start bar")
)
hl.bind(x.mod.shift .. " + N", hl.dsp.exec_cmd(x.uwsm .. x.util.notification .. " restore"))
hl.bind(x.mod[1] .. " + F10", hl.dsp.exec_cmd(x.uwsm .. x.dir.scripts .. "monitors.sh"))
hl.bind(x.mod.shift .. " + G", hl.dsp.exec_cmd(x.uwsm .. x.dir.scripts .. "background_swap.sh"))
hl.bind(x.mod.ctrl .. " + G", hl.dsp.exec_cmd(x.uwsm .. x.dir.scripts .. "background_swap_prev.sh"))

-- Utility Dispatchers
hl.bind(x.mod[1] .. " + F1", hl.dsp.exec_cmd(x.uwsm .. x.util.lock))
hl.bind("Print", hl.dsp.exec_cmd(x.uwsm .. x.util.snap))
hl.bind(x.mod.shift .. " + V", hl.dsp.exec_cmd(x.uwsm .. x.util.clip))
hl.bind(x.mod.shift .. " + R", hl.dsp.exec_cmd("hyprctl reload"), { repeating = true })

------------------------------------
-- EXTRA JAPANESE KEY INTEGRATION --
------------------------------------
hl.bind(x.extra_kb, hl.dsp.exec_cmd(x.bar_toggle))
hl.bind(x.extra_kb, hl.dsp.exec_cmd(x.bar_toggle), { release = true })

-- ----------------------
-- -- SCROLLING LAYOUT --
-- ----------------------
-- hl.bind(mainMod .. " + period", hl.dsp.layoutmsg("move +col"))
-- hl.bind(mainMod .. " + comma", hl.dsp.layoutmsg("move -col"))
-- hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layoutmsg("movewindowto r"))
-- hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.layoutmsg("movewindowto l"))
-- hl.bind(mainMod .. " + SHIFT + up", hl.dsp.layoutmsg("movewindowto u"))
-- hl.bind(mainMod .. " + SHIFT + down", hl.dsp.layoutmsg("movewindowto d"))
--
-- hl.bind(mainMod .. " + A", hl.dsp.layoutmsg("colresize 1.0"))
-- hl.bind(mainMod .. " + SHIFT + E", hl.dsp.layoutmsg("colresize 0.5"))
-- hl.bind(mainMod .. " + CTRL + right", hl.dsp.layoutmsg("colresize +conf"))
-- hl.bind(mainMod .. " + CTRL + left", hl.dsp.layoutmsg("colresize -conf"))
-- hl.bind(mainMod .. " + U", hl.dsp.layoutmsg("promote"))

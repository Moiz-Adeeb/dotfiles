local app = require("hyprland.config.app")
local keys = require("hyprland.config.keys")
local term = require("hyprland.config.term")
local util = require("hyprland.config.util")
local misc = require("hyprland.config.misc")
local keybind_helper = require("hyprland.helpers.keybind_helper")

--------------
-- KEYBINDS --
--------------
-- Terminal
hl.bind(keys.mod.shift .. " + " .. keys.enter, hl.dsp.exec_cmd(misc.uwsm .. term.app))
hl.bind(
	keys.mod.ctrl .. " + " .. keys.enter,
	hl.dsp.exec_cmd(
		misc.uwsm
			.. term.app
			.. " -a "
			.. misc.win.lg
			.. " -e "
			.. term.sh
			.. " -C "
			.. term.monitor[term.monitor.default].cmd
	)
)
hl.bind(
	keys.mod.enter,
	hl.dsp.exec_cmd(
		misc.uwsm
			.. term.app
			.. " -a "
			.. misc.win.sm
			.. " -e "
			.. term.sh
			.. " -C "
			.. term.monitor[term.monitor.default].cmd
	)
)
hl.bind(
	keys.alt .. " + " .. keys.period,
	hl.dsp.exec_cmd(
		misc.uwsm
			.. term.app
			.. " --title "
			.. app.editor[app.editor.default].name
			.. ' -e sh -c "'
			.. term.mux
			.. " '"
			.. app.editor[app.editor.default].id
			.. " "
			.. misc.dir.conf
			.. [['"]]
	)
)

------------------------------------------
-- Core Operations & Window Dispatchers --
------------------------------------------
-- Open Application
keybind_helper.app_bind("E", app.file_mgr, "File Manager")
keybind_helper.app_bind("O", app.browser, "Browser")
keybind_helper.app_bind("M", app.audio, "Audio")
keybind_helper.app_bind("N", app.network, "Network")
keybind_helper.app_bind("B", app.bluetooth, "Bluetooth")
keybind_helper.app_bind(keys.esc, app.sys_monitor, "System Monitor")
keybind_helper.app_bind(keys.semicolon, app.editor, "Text Editor")

-- Application Menu
for _, key in ipairs({ keys.mod[1] .. " + D", keys.alt .. " + " .. keys.space }) do
	hl.bind(key, hl.dsp.exec_cmd(misc.uwsm .. misc.menu.app))
end
hl.bind(keys.mod[1] .. " + P", hl.dsp.exec_cmd(misc.uwsm .. misc.menu.power))

-- Close Window
for _, key in ipairs({ keys.mod[1] .. " + X", keys.alt .. " + F4", keys.mod.shift .. " + Q" }) do
	hl.bind(key, hl.dsp.window.close())
end

hl.bind(keys.mod.ctrl .. " + L", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(keys.mod.ctrl .. " + E", hl.dsp.exit())

---------------------
-- System Controls --
---------------------
-- Audio Control
hl.bind(keys.vol.kb .. "RaiseVolume", hl.dsp.exec_cmd(keys.vol.ctl .. " +5%"), { repeating = true })
hl.bind(keys.vol.kb .. "LowerVolume", hl.dsp.exec_cmd(keys.vol.ctl .. " -5%"), { repeating = true })
hl.bind(keys.vol.kb .. "Mute", hl.dsp.exec_cmd(keys.vol.mut), { repeating = true })
hl.bind(keys.vol.kb .. "MicMute", hl.dsp.exec_cmd(keys.vol.mic.mut), { repeating = true })

-- Brightness Control
hl.bind(keys.bright.kb .. "Up", hl.dsp.exec_cmd(keys.bright.ctl .. " +0.05"), { repeating = true })
hl.bind(keys.bright.kb .. "Down", hl.dsp.exec_cmd(keys.bright.ctl .. " -0.05"), { repeating = true })

-- Media Controls
hl.bind(keys.vol.kb .. "Next", hl.dsp.exec_cmd(util.media .. " next"), { repeating = true })
hl.bind(keys.vol.kb .. "Pause", hl.dsp.exec_cmd(util.media .. " play-pause"), { repeating = true })
hl.bind(keys.vol.kb .. "Play", hl.dsp.exec_cmd(util.media .. " play-pause"), { repeating = true })
hl.bind(keys.vol.kb .. "Prev", hl.dsp.exec_cmd(util.media .. " previous"), { repeating = true })

-------------------------------
-- System Services & Scripts --
-------------------------------
-- (Service) Terminal Server
hl.bind(keys.mod.shift .. " + W", hl.dsp.exec_cmd(misc.uwsm .. "systemctl --user restart foot-server"))

-- (Service) Status Bar
hl.bind(keys.mod[1] .. " + U", hl.dsp.exec_cmd("pkill -SIGUSR1 " .. util.status_bar))
hl.bind(keys.mod.shift .. " + U", hl.dsp.exec_cmd(misc.uwsm .. "systemctl --user restart bar"))
hl.bind(
	keys.mod.ctrl .. " + U",
	hl.dsp.exec_cmd("systemctl --user is-active --quiet bar && systemctl --user stop bar || systemctl --user start bar")
)

-- (Service) Idle Daemon
hl.bind(
	keys.mod.shift .. " + I",
	hl.dsp.exec_cmd(
		"systemctl --user is-active --quiet idle && systemctl --user stop idle || systemctl --user start idle"
	)
)

-- (Service) Notification
hl.bind(keys.mod.shift .. " + Y", hl.dsp.exec_cmd(misc.uwsm .. util.notification .. "ctl restore"))
hl.bind(
	keys.mod.ctrl .. " + Y",
	hl.dsp.exec_cmd(
		"systemctl --user is-active --quiet mako && systemctl --user stop mako || systemctl --user start mako"
	)
)

-- (Script) Monitors
hl.bind(keys.mod[1] .. " + F10", hl.dsp.exec_cmd(misc.uwsm .. misc.dir.scripts .. "monitors.sh"))

-- (Script) Wallpaper
hl.bind(keys.mod[1] .. " + G", hl.dsp.exec_cmd(misc.uwsm .. "systemctl --user restart swaybg"))
hl.bind(keys.mod.shift .. " + G", hl.dsp.exec_cmd(misc.uwsm .. misc.dir.scripts .. "background_swap.sh"))
hl.bind(keys.mod.ctrl .. " + G", hl.dsp.exec_cmd(misc.uwsm .. misc.dir.scripts .. "background_swap_prev.sh"))

-------------------------
-- Utility Dispatchers --
-------------------------
hl.bind(keys.mod[1] .. " + F1", hl.dsp.exec_cmd(misc.uwsm .. util.lock))
hl.bind(keys.print, hl.dsp.exec_cmd(misc.uwsm .. util.screenshot))
hl.bind(keys.mod.shift .. " + V", hl.dsp.exec_cmd(misc.uwsm .. util.clipboard))
hl.bind(keys.mod.shift .. " + R", hl.dsp.exec_cmd(misc.uwsm .. "hyprctl reload"), { repeating = true })

-----------------------------------
-- EXTRA JAPANESE KEY INTEGRATION --
------------------------------------
hl.bind(keys.extra_kb, hl.dsp.exec_cmd("pkill -SIGUSR1 " .. util.status_bar))
hl.bind(keys.extra_kb, hl.dsp.exec_cmd("pkill -SIGUSR1 " .. util.status_bar), { release = true })

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

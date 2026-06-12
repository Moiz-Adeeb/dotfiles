local key = require("hyprland.variables")
--------------
-- KEYBINDS --
--------------
-- Terminal
hl.bind(
	key.mod.ctrl .. " + " .. key.enter,
	hl.dsp.exec_cmd(
		key.uwsm .. key.term.app .. " -a " .. key.window.large .. " -e " .. key.term.shell .. " -C " .. key.term.monitor
	)
)
hl.bind(
	key.mod.enter,
	hl.dsp.exec_cmd(
		key.uwsm .. key.term.app .. " -a " .. key.window.small .. " -e " .. key.term.shell .. " -C " .. key.term.monitor
	)
)
hl.bind(key.mod.shift .. " + " .. key.enter, hl.dsp.exec_cmd(key.uwsm .. key.term.app))
hl.bind(
	key.alt .. " + PERIOD",
	hl.dsp.exec_cmd(
		key.uwsm
			.. key.term.app
			.. ' -e sh -c "'
			.. key.term.multiplexer
			.. " '"
			.. key.app.editor.nvim
			.. [[ ~/.config/'"]]
	)
)

-- Core Operations & Window Dispatchers
hl.bind(key.mod[1] .. " + E", hl.dsp.exec_cmd(key.uwsm .. key.app.file_mgr.yazi))
hl.bind(key.mod.shift .. " + E", hl.dsp.exec_cmd(key.uwsm .. key.app.file_mgr.thunar))

hl.bind(key.mod[1] .. " + ESCAPE", hl.dsp.exec_cmd(key.uwsm .. key.app.sys_monitor.btop))
hl.bind(key.alt .. " + ESCAPE", hl.dsp.exec_cmd(key.uwsm .. key.app.sys_monitor.htop))
hl.bind(key.ctrl .. " + ESCAPE", hl.dsp.exec_cmd(key.uwsm .. key.app.sys_monitor.gtop))

hl.bind(key.mod[1] .. " + O", hl.dsp.exec_cmd(key.uwsm .. key.app.browser.zen))
hl.bind(key.mod.shift .. " + O", hl.dsp.exec_cmd(key.uwsm .. key.app.browser.brave))
hl.bind(key.mod.ctrl .. " + O", hl.dsp.exec_cmd(key.uwsm .. key.app.browser.chrome))

hl.bind(key.mod[1] .. " + D", hl.dsp.exec_cmd(key.uwsm .. key.menu.app))
hl.bind(key.alt .. " + " .. key.space, hl.dsp.exec_cmd(key.uwsm .. key.menu.app))
hl.bind(key.mod[1] .. " + P", hl.dsp.exec_cmd(key.uwsm .. key.menu.power))

hl.bind(key.mod[1] .. " + X", hl.dsp.window.close())
hl.bind(key.alt .. " + F4", hl.dsp.window.close())
hl.bind(key.mod.shift .. " + Q", hl.dsp.window.close())

hl.bind(key.mod.ctrl .. " + L", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(key.mod.ctrl .. " + E", hl.dsp.exit())

-- Network / Bluetooth / Audio
hl.bind(key.mod.shift .. " + I", hl.dsp.exec_cmd(key.uwsm .. key.app.network))
hl.bind(key.mod.shift .. " + M", hl.dsp.exec_cmd(key.uwsm .. key.app.bluetooth))
hl.bind(key.mod.shift .. " + W", hl.dsp.exec_cmd(key.uwsm .. key.app.audio))

-- Audio Control
hl.bind(key.vol.kb .. "RaiseVolume", hl.dsp.exec_cmd(key.vol.ctl .. " +5%"), { repeating = true })
hl.bind(key.vol.kb .. "LowerVolume", hl.dsp.exec_cmd(key.vol.ctl .. " -5%"), { repeating = true })
hl.bind(key.vol.kb .. "Mute", hl.dsp.exec_cmd(key.vol.mut), { repeating = true })
hl.bind(key.vol.kb .. "MicMute", hl.dsp.exec_cmd(key.vol.mic.mut), { repeating = true })

-- Brightness Control
hl.bind(key.bright.kb .. "Up", hl.dsp.exec_cmd(key.bright.ctl .. " +0.05"), { repeating = true })
hl.bind(key.bright.kb .. "Down", hl.dsp.exec_cmd(key.bright.ctl .. " -0.05"), { repeating = true })

-- Media Controls
hl.bind(key.vol.kb .. "Next", hl.dsp.exec_cmd(key.util.media .. " next"), { repeating = true })
hl.bind(key.vol.kb .. "Pause", hl.dsp.exec_cmd(key.util.media .. " play-pause"), { repeating = true })
hl.bind(key.vol.kb .. "Play", hl.dsp.exec_cmd(key.util.media .. " play-pause"), { repeating = true })
hl.bind(key.vol.kb .. "Prev", hl.dsp.exec_cmd(key.util.media .. " previous"), { repeating = true })

-- System Services & Scripts
hl.bind(key.mod.shift .. " + Z", hl.dsp.exec_cmd("systemctl --user restart foot-server"))
hl.bind(key.mod[1] .. " + B", hl.dsp.exec_cmd(key.bar_toggle))
hl.bind(key.mod.shift .. " + B", hl.dsp.exec_cmd(key.uwsm .. "systemctl --user restart bar"))
hl.bind(
	key.mod.ctrl .. " + B",
	hl.dsp.exec_cmd("systemctl --user is-active --quiet bar && systemctl --user stop bar || systemctl --user start bar")
)
hl.bind(key.mod.shift .. " + N", hl.dsp.exec_cmd(key.uwsm .. key.util.notification .. " restore"))
hl.bind(key.mod[1] .. " + F10", hl.dsp.exec_cmd(key.uwsm .. key.dir.scripts .. "monitors.sh"))
hl.bind(key.mod.shift .. " + G", hl.dsp.exec_cmd(key.uwsm .. key.dir.scripts .. "background_swap.sh"))
hl.bind(key.mod.ctrl .. " + G", hl.dsp.exec_cmd(key.uwsm .. key.dir.scripts .. "background_swap_prev.sh"))

-- Utility Dispatchers
hl.bind(key.mod[1] .. " + F1", hl.dsp.exec_cmd(key.uwsm .. key.util.lock))
hl.bind("Print", hl.dsp.exec_cmd(key.uwsm .. key.util.snap))
hl.bind(key.mod.shift .. " + V", hl.dsp.exec_cmd(key.uwsm .. key.util.clip))
hl.bind(key.mod.shift .. " + R", hl.dsp.exec_cmd("hyprctl reload"), { repeating = true })

------------------------------------
-- EXTRA JAPANESE KEY INTEGRATION --
------------------------------------
hl.bind(key.extra_kb, hl.dsp.exec_cmd(key.bar_toggle))
hl.bind(key.extra_kb, hl.dsp.exec_cmd(key.bar_toggle), { release = true })

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

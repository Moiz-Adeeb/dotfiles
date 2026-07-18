local keys = require("hyprland.config.keys")
local term = require("hyprland.config.term")
local misc = require("hyprland.config.misc")

local app = {
	---@type AppList
	editor = {
		default = 1,
		{
			id = "nvim",
			name = "Neovim",
			cmd = term.app .. " --title Nvim -e nvim",
		},
		{
			id = "vim",
			name = "Vim",
			cmd = term.app .. " --title Vim -e vim",
		},
		{
			id = "nano",
			name = "Nano",
			cmd = term.app .. " --title Nano -e nano",
		},
	},
	---@type AppList
	network = {
		default = 1,
		toggle = "rfkill toggle wifi",
		{
			id = "impala",
			name = "Impala",
			cmd = term.app .. " --title Impala -a " .. misc.win.sm .. " -e impala",
		},
		{
			id = "iwctl",
			name = "Iwd",
			cmd = term.app .. " --title Iwd -a " .. misc.win.sm .. " -e iwctl",
		},
	},
	---@type AppList
	bluetooth = {
		default = 1,
		toggle = "bluetoothctl show | grep -q 'Powered: yes' && bluetoothctl power off || bluetoothctl power on",
		{
			id = "bluetui",
			name = "Bluetui",
			cmd = term.app .. " --title Bluetui -a " .. misc.win.sm .. " -e bluetui",
		},
		{
			id = "bluetoothctl",
			name = "Bluetoothctl",
			cmd = term.app .. " --title Bluetoothctl -a " .. misc.win.sm .. " -e bluetoothctl",
		},
	},
	---@type AppList
	audio = {
		default = 1,
		toggle = keys.vol.mut,
		{
			id = "wiremix",
			name = "Wiremix",
			cmd = term.app .. " --title Wiremix -a " .. misc.win.sm .. " -e wiremix",
		},
		{
			id = "pavucontrol",
			name = "Pavucontrol",
			cmd = "pavucontrol",
		},
		{
			id = "hyprpwcenter",
			name = "Hyprpwcenter",
			cmd = "hyprpwcenter",
		}

	},
	---@type AppList
	file_mgr = {
		default = 1,
		{
			id = "yazi",
			name = "Yazi",
			cmd = term.app .. " --title Yazi -a " .. misc.win.lg .. " -e yazi",
		},
		{
			id = "thunar",
			name = "Thunar",
			cmd = "thunar",
		},
	},
	---@type AppList
	sys_monitor = {
		default = 1,
		{
			id = "btop",
			name = "Btop",
			cmd = term.app .. " --title Btop -a " .. misc.win.lg .. " -e btop",
		},
		{
			id = "htop",
			name = "Htop",
			cmd = term.app .. " --title Htop -a " .. misc.win.lg .. " -e htop",
		},
		{
			id = "gtop",
			name = "Gtop",
			cmd = term.app .. " --title Gtop -a " .. misc.win.lg .. " -e gtop",
		},
		{
			id = "top",
			name = "Top",
			cmd = term.app .. " --title Top -a " .. misc.win.lg .. " -e top",
		},
	},
	---@type AppList
	browser = {
		default = 1,
		{
			id = "zen-browser",
			name = "Zen Browser",
			cmd = "zen-browser",
		},
		{
			id = "brave",
			name = "Brave Browser",
			cmd = "brave",
		},
		{
			id = "google-chrome-stable",
			name = "Google Chrome",
			cmd = "google-chrome-stable",
		},
		{
			id = "qutebrowser",
			name = "Qutebrowser",
			cmd = "qutebrowser",
		},
		{
			id = "chromium",
			name = "Chromium",
			cmd = "chromium",
		},
	},
}

return app

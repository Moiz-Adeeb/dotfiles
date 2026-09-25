return {
	"echasnovski/mini.statusline",
	event = "VeryLazy",
	version = false,
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		local function set_sl(group, fg_color, is_bold)
			vim.api.nvim_set_hl(0, group, {
				fg = fg_color,
				bg = "NONE",
				ctermbg = "NONE",
				bold = is_bold or false,
				nocombine = true,
			})
		end

		set_sl("StatusLine", "#E5E9F0")
		set_sl("StatusLineNC", "#5E81AC")
		set_sl("MiniStatuslineModeNormal", "#A3BE8C", true)
		set_sl("MiniStatuslineModeInsert", "#D19A66", true)
		set_sl("MiniStatuslineModeVisual", "#FE81AC", true)
		set_sl("MiniStatuslineModeReplace", "#FE81AC", true)
		set_sl("MiniStatuslineModeCommand", "#EBCB8B", true)
		set_sl("MiniStatuslineModeOther", "#88C0D0", true)
		set_sl("MiniStatuslineDevinfo", "#5E81AC")
		set_sl("MiniStatuslineFilename", "#E5E9F0", true)
		set_sl("MiniStatuslineFileinfo", "#5E81AC")
		set_sl("MiniStatuslineLocation", "#D19A66", true)
	end,
}

-- return {
-- 	"nvim-mini/mini.statusline",
-- 	event = "VeryLazy",
-- 	version = false,
-- 	opts = {
-- 		use_icons = vim.g.have_nerd_font,
-- 	},
-- 	init = function()
-- 		local statusline = require("mini.statusline")
-- 		statusline.setup({ use_icons = vim.g.have_nerd_font })
--
-- 		---@diagnostic disable-next-line: duplicate-set-field
-- 		statusline.section_location = function()
-- 			return "%2l:%-2v"
-- 		end
-- 	end,
-- }

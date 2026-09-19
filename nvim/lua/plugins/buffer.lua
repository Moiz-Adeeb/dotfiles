return {
	{ "famiu/bufdelete.nvim" },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
		config = function()
			local forced_transparent_ui = { bg = "NONE", ctermbg = "NONE", nocombine = true }
			vim.api.nvim_set_hl(0, "TabLineFill", forced_transparent_ui)
			vim.api.nvim_set_hl(0, "TabLine", forced_transparent_ui)
			vim.api.nvim_set_hl(0, "WinBar", forced_transparent_ui)
			vim.api.nvim_set_hl(0, "WinBarNC", forced_transparent_ui)
			require("bufferline").setup({
				options = {
					mode = "buffers",
					always_show_bufferline = true,
					sort_by = "insert_after_current",

					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false,
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					enforce_regular_tabs = false,
					show_duplicate_prefix = true,
					tab_size = 20,
					max_name_length = 25,
					show_buffer_icons = true,
					color_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
					},
				},
				-- highlights = {
				-- 	fill = { bg = "NONE" },
				-- 	offset_separator = { bg = "NONE", fg = "NONE" },
				-- 	background = { fg = "#5E81AC", bg = "NONE" },
				-- 	buffer_visible = { fg = "#5E81AC", bg = "NONE" },
				-- 	modified = { fg = "#A3BE8C", bg = "NONE" },
				-- 	buffer_selected = { fg = "#E5E9F0", bg = "NONE", bold = true },
				-- 	indicator_selected = { fg = "#D19A66", bg = "NONE" },
				-- 	modified_selected = { fg = "#A3BE8C", bg = "NONE", bold = true },
				-- 	close_button = { fg = "#5E81AC", bg = "NONE" },
				-- 	close_button_visible = { fg = "#5E81AC", bg = "NONE" },
				-- 	close_button_selected = { fg = "#FE81AC", bg = "NONE" },
				-- 	separator = { fg = "#1E222A", bg = "NONE" },
				-- 	separator_visible = { fg = "#1E222A", bg = "NONE" },
				-- 	separator_selected = { fg = "#1E222A", bg = "NONE" },
				-- 	error = { fg = "#FE81AC", bg = "NONE" },
				-- 	error_selected = { fg = "#FE81AC", bg = "NONE", bold = true },
				-- 	warning = { fg = "#D19A66", bg = "NONE" },
				-- 	warning_selected = { fg = "#D19A66", bg = "NONE", bold = true },
				-- },
				highlights = {
					-- Main panel backdrops
					fill = { bg = "NONE" },
					offset_separator = { bg = "NONE", fg = "NONE" },

					-- 1. Unselected / Inactive Tabs
					background = { fg = "#5E81AC", bg = "NONE" },
					buffer_visible = { fg = "#5E81AC", bg = "NONE" },
					modified = { fg = "#A3BE8C", bg = "NONE" },
					modified_visible = { fg = "#A3BE8C", bg = "NONE" },

					-- 2. Selected / Active Tabs
					buffer_selected = { fg = "#E5E9F0", bg = "NONE", bold = true },
					indicator_selected = { fg = "#D19A66", bg = "NONE" },
					modified_selected = { fg = "#A3BE8C", bg = "NONE", bold = true },

					-- 3. Closing Actions
					close_button = { fg = "#5E81AC", bg = "NONE" },
					close_button_visible = { fg = "#5E81AC", bg = "NONE" },
					close_button_selected = { fg = "#FE81AC", bg = "NONE" },

					-- 4. Borders & Character Separators (Strips background block boundaries)
					separator = { fg = "#1E222A", bg = "NONE" },
					separator_visible = { fg = "#1E222A", bg = "NONE" },
					separator_selected = { fg = "#1E222A", bg = "NONE" },

					-- 5. Diagnostic Overlays (Strips backgrounds from errors/warnings)
					error = { fg = "#FE81AC", bg = "NONE" },
					error_visible = { fg = "#FE81AC", bg = "NONE" },
					error_selected = { fg = "#FE81AC", bg = "NONE", bold = true },
					warning = { fg = "#D19A66", bg = "NONE" },
					warning_visible = { fg = "#D19A66", bg = "NONE" },
					warning_selected = { fg = "#D19A66", bg = "NONE", bold = true },
					info = { fg = "#E5E9F0", bg = "NONE" },
					info_visible = { fg = "#E5E9F0", bg = "NONE" },
					info_selected = { fg = "#E5E9F0", bg = "NONE", bold = true },
					hint = { fg = "#E5E9F0", bg = "NONE" },
					hint_visible = { fg = "#E5E9F0", bg = "NONE" },
					hint_selected = { fg = "#E5E9F0", bg = "NONE", bold = true },
				},
				-- highlights = {
				-- 	fill = {
				-- 		bg = "NONE",
				-- 	},
				-- 	offset_separator = {
				-- 		bg = "NONE",
				-- 		fg = "NONE",
				-- 	},
				-- 	background = {
				-- 		fg = "#5E81AC",
				-- 		bg = "NONE",
				-- 	},
				-- 	buffer_visible = {
				-- 		fg = "#5E81AC",
				-- 		bg = "NONE",
				-- 	},
				-- 	modified = {
				-- 		fg = "#A3BE8C",
				-- 		bg = "NONE",
				-- 	},
				-- 	buffer_selected = {
				-- 		fg = "#E5E9F0",
				-- 		bg = "NONE",
				-- 		bold = true,
				-- 	},
				-- 	indicator_selected = {
				-- 		fg = "#D19A66",
				-- 		bg = "NONE",
				-- 	},
				-- 	modified_selected = {
				-- 		fg = "#A3BE8C",
				-- 		bg = "NONE",
				-- 		bold = true,
				-- 	},
				-- 	close_button = {
				-- 		fg = "#5E81AC",
				-- 		bg = "NONE",
				-- 	},
				-- 	close_button_visible = {
				-- 		fg = "#5E81AC",
				-- 		bg = "NONE",
				-- 	},
				-- 	close_button_selected = {
				-- 		fg = "#FE81AC",
				-- 		bg = "NONE",
				-- 	},
				-- 	separator = {
				-- 		fg = "#1E222A",
				-- 		bg = "NONE",
				-- 	},
				-- 	separator_visible = {
				-- 		fg = "#1E222A",
				-- 		bg = "NONE",
				-- 	},
				-- 	separator_selected = {
				-- 		fg = "#1E222A",
				-- 		bg = "NONE",
				-- 	},
				-- },
			})
		end,
		keys = {
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<leader>x", "<cmd>Bdelete<cr>", desc = "Close Buffer" },
			{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Buffer" },
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers" },
		},
	},
}

-- return {
-- 	"stevearc/oil.nvim",
-- 	opts = {},
-- 	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
-- 	keys = {
-- 		{
-- 			"-",
-- 			function()
-- 				require("oil").open_float()
-- 			end,
-- 			desc = "Open parent directory",
-- 		},
-- 	},
-- }
--
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			keymaps = {
				["g?"] = "actions.show_help",

				-- Open File
				["<CR>"] = "actions.select",
				["l"] = "actions.select",
				["<Right>"] = "actions.select",

				["<Left>"] = "actions.parent",
				["h"] = "actions.parent",
				["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
				["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
				["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["q"] = "actions.close",
				["<Esc>"] = "actions.close",
				["a"] = {
					desc = "Create new file or folder silently",
					callback = function()
						vim.ui.input({ prompt = "Create new file/folder: " }, function(name)
							if not name or name == "" then
								return
							end

							vim.api.nvim_put({ name }, "l", true, true)

							require("oil").save({ confirm = false })
						end)
					end,
				},
			},
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_all = true,
			float = {
				padding = 8,
				max_width = 120,
				max_height = 30,
				border = "rounded", -- Options: "single", "double", "shadow", "rounded"
				win_options = {
					winblend = 0,
				},
			},
		})

		vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })
		vim.keymap.set("n", "f", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })
		-- vim.keymap.set("n", "-", "<cmd>lua require('oil').open_float()<CR>", { desc = "Open Oil Floating Window" })
		-- vim.keymap.set("n", "f", "<cmd>lua require('oil').open_float()<CR>", { desc = "Open Oil Floating Window" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.keymap.set("n", "a", function()
					vim.ui.input({ prompt = "Create new file/folder: " }, function(name)
						if not name or name == "" then
							return
						end

						vim.api.nvim_put({ name }, "l", true, true)

						vim.cmd("write")
					end)
				end, { buffer = true, desc = "Create new file or folder" })
			end,
		})
	end,
}

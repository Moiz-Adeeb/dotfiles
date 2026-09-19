return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	version = "*",
	config = function()
		require("toggleterm").setup({
			winbar = {
				enabled = true,
				name_formatter = function(term)
					return term.name or ("Terminal " .. term.id)
				end,
			},
			size = 15,
			open_mapping = [[<C-t>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			autopoint = true,
			persist_mode = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		})

		vim.keymap.set({ "n", "t" }, "<C-t>", [[<Cmd>ToggleTerm<CR>]], { desc = "Toggle Terminal" })
		vim.keymap.set({ "n", "t" }, "<leader>tr", "<cmd>ToggleTermSetName<cr>", { desc = "Rename Terminal" })

		local terminal_count = 0
		vim.keymap.set({ "n", "t" }, "<leader>tn", function()
			local terminal_list = require("toggleterm.terminal").get_all()
			for _, term in ipairs(terminal_list) do
				if term:is_open() then
					term:close()
				end
			end

			terminal_count = terminal_count + 1

			vim.cmd(terminal_count .. "ToggleTerm direction=horizontal")
		end, { desc = "New Terminal Tab (Force No-Split)" })

		vim.keymap.set({ "n", "t" }, "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
		vim.keymap.set({ "n", "t" }, "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

		vim.keymap.set({ "n", "t" }, "<C-n>", [[<Cmd>wincmd w<CR>]], { desc = "Go to next window" }) -- Jump out to code
		vim.keymap.set({ "n", "t" }, "<A-j>", function()
			local all_terms = require("toggleterm.terminal").get_all()
			if #all_terms == 0 then
				return
			end

			for _, term in ipairs(all_terms) do
				if term:is_open() then
					term:close()
				end
			end

			terminal_count = (terminal_count % #all_terms) + 1
			vim.cmd(terminal_count .. "ToggleTerm")
		end, { desc = "Cycle Next Terminal Tab" })

		vim.keymap.set({ "n", "t" }, "<C-n>", [[<C-\><C-n><C-w>w]], { desc = "Focus Code Window" })

		vim.keymap.set({ "n", "t" }, "<leader>ts", "<cmd>TermSelect<cr>", { desc = "Select Terminal" })

		vim.keymap.set(
			{ "n", "t" },
			"<leader>th",
			"<cmd>1ToggleTerm direction=horizontal<cr>",
			{ desc = "Terminal Horizontal" }
		)
		vim.keymap.set(
			{ "n", "t" },
			"<leader>tv",
			"<cmd>2ToggleTerm direction=vertical size=60<cr>",
			{ desc = "Terminal Vertical" }
		)
		vim.keymap.set({ "n", "t" }, "<leader>tf", "<cmd>3ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
	end,
}

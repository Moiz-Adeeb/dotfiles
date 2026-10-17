return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		-- { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	config = function()
		vim.keymap.set("n", "<leader>lg", function()
			Snacks.lazygit()
		end, { desc = "Lazygit" })

		vim.g.lazygit_floating_window_winblend = 0
		vim.g.lazygit_floating_window_use_plenary = 1
		vim.g.lazygit_use_neovim_remote = 1
	end,
}

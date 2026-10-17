return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				ui = {
					border = "rounded",
				},
				decorations = {
					statusline = {
						device = true,
					},
				},
				lsp = {
					color_render = true,
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
					},
				},
			})
		end,
	},
}

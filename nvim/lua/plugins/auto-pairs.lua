return {
	{
		"nvim-mini/mini.pairs",
		event = "VeryLazy",
		version = false,
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			-- Explicitly load via the modern community standard initialization pattern
			require("nvim-ts-autotag").setup({
				opts = {
					opts = {
						-- Enable auto-closing behavior
						enable_close = true,
						-- Enable auto-renaming when editing tag names
						enable_rename = true,
						-- Enable closing tags when typing "/" in an open tag
						enable_close_on_slash = true,
					},
					-- Restrict to specific filetypes if desired
					per_filetype = {
						["html"] = { enable_close = true },
						["javascriptreact"] = { enable_close = true },
						["typescriptreact"] = { enable_close = true },
					},
				},
			})
		end,
	},
}

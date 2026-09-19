return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = false, cpp = false }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 5000,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			cs = { "csharpier", "dotnet-format" },
			javascript = { "prettierd", "rustywind", stop_after_first = true },
			typescript = { "prettierd", "eslint_d", "rustywind", stop_after_first = true },
			javascriptreact = { "prettierd", "rustywind", stop_after_first = true },
			typescriptreact = { "prettierd", "rustywind", stop_after_first = true },
			json = { "prettierd", "rustywind", stop_after_first = true },
			markdown = { "prettierd", "rustywind", stop_after_first = true },
			html = { "prettierd", "rustywind", stop_after_first = true },
			angular = { "prettierd", "rustywind" },
			ini = { "ini_formatter" },
		},
	},
}

return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters["dotnet-format"] = {
				cmd = "dotnet",
				args = { "format", "analyzers", "--verify-no-changes", "--severity", "info" },
				stdin = false,
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_pattern(
					"([^:]+)(%((%d+),(%d+)%)):%s+(%w+)%s+(%w+):%s+(.*)",
					{ "file", "lnum", "col", "severity", "code", "message" }
				),
			}

			lint.linters_by_ft = {
				cs = { "dotnet-format" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}

-- return {
-- 	{
-- 		"mfussenegger/nvim-lint",
-- 		event = { "BufReadPre", "BufNewFile" },
-- 		config = function()
-- 			local lint = require("lint")
--
-- 			-- 1. Map your languages to their respective linters
-- 			lint.linters_by_ft = {
-- 				cs = { "dotnet-format" },
-- 				javascript = { "eslint_d" },
-- 				typescript = { "eslint_d" },
-- 				javascriptreact = { "eslint_d" },
-- 				typescriptreact = { "eslint_d" },
-- 			}
--
-- 			-- 2. Create an autocmd to automatically trigger linting
-- 			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- 			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
-- 				group = lint_augroup,
-- 				callback = function()
-- 					lint.try_lint()
-- 				end,
-- 			})
-- 		end,
-- 	},
-- }

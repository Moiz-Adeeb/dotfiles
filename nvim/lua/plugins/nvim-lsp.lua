-- return {
-- 	{ "Hoffs/omnisharp-extended-lsp.nvim" },
-- 	{
-- 		-- Main LSP Configuration
-- 		"neovim/nvim-lspconfig",
-- 		event = "VeryLazy",
-- 		dependencies = {
-- 			-- Single, unified Mason block with your custom registries
-- 			{
-- 				"mason-org/mason.nvim",
-- 				opts = {
-- 					registries = {
-- 						"github:mason-org/mason-registry",
-- 						"github:Crashdummyy/mason-registry",
-- 					},
-- 				},
-- 			},
-- 			"mason-org/mason-lspconfig.nvim",
-- 			"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 			{ "j-hui/fidget.nvim", opts = {} },
-- 			"saghen/blink.cmp",
-- 		},
-- 		config = function()
-- 			-- 1. Automated System Tool Installation via Mason
-- 			require("mason-tool-installer").setup({
-- 				ensure_installed = {
-- 					-- Core Language Servers (LSP)
-- 					"tailwindcss",
-- 					"ts_ls",
-- 					"lua_ls",
-- 					"html",
--
-- 					-- Downstream Web System Binaries (used by conform & nvim-lint)
-- 					"prettierd",
-- 					"rustywind",
-- 					"eslint_d",
-- 					"stylua",
-- 				},
-- 			})
--
-- 			-- 2. Buffer Event Hook: Triggers when an LSP successfully binds to a file
-- 			vim.api.nvim_create_autocmd("LspAttach", {
-- 				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
-- 				callback = function(event)
-- 					local map = function(keys, func, desc, mode)
-- 						-- Clean handling to support tables passed as mode options
-- 						mode = mode or "n"
-- 						if type(mode) == "string" then
-- 							mode = { mode }
-- 						end
-- 						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 					end
--
-- 					-- Keybind Maps via Snacks.picker
-- 					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
-- 					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
-- 					map("<leader>cd", vim.lsp.buf.hover, "[C]ode [D]ocumentation", { "n", "x" })
--
-- 					map("gr", function()
-- 						Snacks.picker.lsp_references()
-- 					end, "[G]oto [R]eferences")
-- 					map("gI", function()
-- 						Snacks.picker.lsp_implementations()
-- 					end, "[G]oto [I]mplementation")
-- 					map("gd", function()
-- 						Snacks.picker.lsp_definitions()
-- 					end, "[G]oto [D]efinition")
-- 					map("gD", function()
-- 						Snacks.picker.lsp_declarations()
-- 					end, "[G]oto [D]eclaration")
-- 					map("gt", function()
-- 						Snacks.picker.lsp_type_definitions()
-- 					end, "[G]oto [T]ype Definition")
--
-- 					map("<leader>ds", function()
-- 						Snacks.picker.lsp_symbols()
-- 					end, "Open [D]ocument [S]ymbols")
-- 					map("<leader>ws", function()
-- 						Snacks.picker.lsp_workspace_symbols()
-- 					end, "Open [W]orkspace [S]ymbols")
--
-- 					-- Cross-version method compatibility utility
-- 					local function client_supports_method(client, method, bufnr)
-- 						if vim.fn.has("nvim-0.11") == 1 then
-- 							return client:supports_method(method, bufnr)
-- 						else
-- 							return client.supports_method(method, { bufnr = bufnr })
-- 						end
-- 					end
--
-- 					-- Active Context Highlight Triggers
-- 					local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 					if
-- 						client
-- 						and client_supports_method(
-- 							client,
-- 							vim.lsp.protocol.Methods.textDocument_documentHighlight,
-- 							event.buf
-- 						)
-- 					then
-- 						local highlight_augroup =
-- 							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
-- 						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 							buffer = event.buf,
-- 							group = highlight_augroup,
-- 							callback = vim.lsp.buf.document_highlight,
-- 						})
--
-- 						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 							buffer = event.buf,
-- 							group = highlight_augroup,
-- 							callback = vim.lsp.buf.clear_references,
-- 						})
--
-- 						vim.api.nvim_create_autocmd("LspDetach", {
-- 							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
-- 							callback = function(event2)
-- 								vim.lsp.buf.clear_references()
-- 								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
-- 							end,
-- 						})
-- 					end
--
-- 					-- Inlay Hints Toggle Setup
-- 					if
-- 						client
-- 						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
-- 					then
-- 						map("<leader>th", function()
-- 							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
-- 						end, "[T]oggle Inlay [H]ints")
-- 					end
-- 				end,
-- 			})
--
-- 			-- 3. Define configurations for your target Language Servers
-- 			local lspconfig = require("lspconfig")
-- 			local servers = {
-- 				tailwindcss = {
-- 					filetypes = {
-- 						"html",
-- 						"typescript",
-- 						"typescriptreact",
-- 						"javascript",
-- 						"javascriptreact",
-- 						"css",
-- 						"scss",
-- 						"sass",
-- 						"angular",
-- 					},
-- 					settings = {
-- 						tailwindCSS = {
-- 							includeLanguages = {
-- 								typescript = "javascript",
-- 								-- angular = "html", -- Treat Angular template structures like HTML
-- 								scss = "css", -- Treat SCSS variables like native CSS
-- 							},
-- 							experimental = {
-- 								-- Enables autocomplete inside custom variables or class string functions
-- 								classRegex = {
-- 									{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
-- 									{ "twMerge\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
-- 								},
-- 							},
-- 						},
-- 					},
-- 				},
-- 				-- ts_ls = {},
-- 				vtsls = {},
-- 				-- omnisharp = {},
-- 				-- angularls = {
-- 				-- 	cmd = {
-- 				-- 		"ngserver",
-- 				-- 		"--stdio",
-- 				-- 		"--tsProbeLocations",
-- 				-- 		vim.fn.expand(
-- 				-- 			"~/.local/share/nvim/mason/packages/angular-language-server/node_modules/typescript/lib"
-- 				-- 		),
-- 				-- 		"--ngProbeLocations",
-- 				-- 		vim.fn.expand(
-- 				-- 			"~/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/bin"
-- 				-- 		),
-- 				-- 	},
-- 				--
-- 				-- 	-- Ensure the server actively attaches to both standard html and angular filetypes
-- 				-- 	filetypes = { "typescript", "html", "angular" },
-- 				--
-- 				-- 	-- Tells the server to properly anchor at your project's configuration root
-- 				-- 	root_dir = function(filename)
-- 				-- 		return require("lspconfig.util").root_pattern("angular.json", "nx.json", "package.json")(
-- 				-- 			filename
-- 				-- 		)
-- 				-- 	end,
-- 				--
-- 				-- 	-- Fixes duplicate rename prompt bugs when running both ts_ls and angularls
-- 				-- 	on_attach = function(client, bufnr)
-- 				-- 		client.server_capabilities.renameProvider = false
-- 				-- 	end,
-- 				-- },
-- 				html = {},
-- 				lua_ls = {
-- 					settings = {
-- 						Lua = {
-- 							diagnostics = { globals = { "vim" } },
-- 						},
-- 					},
-- 				},
-- 			}
--
-- 			-- 4. Dynamic initialization hooking into blink.cmp
-- 			require("mason-lspconfig").setup({
-- 				handlers = {
-- 					function(server_name)
-- 						local server_opts = servers[server_name] or {}
--
-- 						-- Inject advanced autocomplete engine stream protocols into capabilities array
-- 						server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
--
-- 						lspconfig[server_name].setup(server_opts)
-- 					end,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }

return {
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			-- Inside your dependencies table:
			{
				"mason-org/mason.nvim",
				opts = {
					registries = {
						"github:mason-org/mason-registry",
						"github:Crashdummyy/mason-registry",
					},
				},
			},

			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			-- Brief aside: **What is LSP?**
			--
			-- LSP is an initialism you've probably heard, but might not understand what it is.
			--
			-- LSP stands for Language Server Protocol. It's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- In general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
			-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
			-- processes that communicate with some "client" - in this case, Neovim!
			--
			-- LSP provides Neovim with features like:
			--  - Go to definition
			--  - Find references
			--  - Autocompletion
			--  - Symbol Search
			--  - and more!
			--
			-- Thus, Language Servers are external tools that must be installed separately from
			-- Neovim. This is where `mason` and related plugins come into play.
			--
			-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					map("<leader>cd", vim.lsp.buf.hover, "[C]ode [D]ocumentation", { "n", "x" })

					-- Find references for the word under your cursor.
					map("gr", function()
						Snacks.picker.lsp_references()
					end, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", function()
						Snacks.picker.lsp_implementations()
					end, "[G]oto [I]mplementation")

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", function()
						Snacks.picker.lsp_definitions()
					end, "[G]oto [D]efinition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", function()
						Snacks.picker.lsp_declarations()
					end, "[G]oto [D]eclaration")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", function()
						Snacks.picker.lsp_symbols()
					end, "Open [D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map("<leader>ws", function()
						Snacks.picker.lsp_workspace_symbols()
					end, "Open [W]orkspace [S]ymbols")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("gt", function()
						Snacks.picker.lsp_type_definitions()
					end, "[G]oto [T]ype Definition")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				update_in_insert = true,
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				-- underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- clangd = {},
				-- gopls = {},
				pyright = {},
				rust_analyzer = {},
				golangci_lint_ls = {},
				angularls = {},
				-- omnisharp = {
				--   use_mono = false,
				--   settings = {
				--     RoslynExtensionsOptions = {
				--       EnableAnalyzersSupport = true,
				--       EnableImportCompletion = true,
				--       AnalyzeOpenDocumentsOnly = true,
				--     },
				--     MsBuild = {
				--       LoadProjectsOnDemand = true,
				--     },
				--     FormattingOptions = {
				--       EnableEditorConfigSupport = true,
				--       },
				--     Sdk = {
				--       IncludePrereleases = true, -- Useful if you use .NET 9.0/10.0 previews
				--     },
				--   },
				-- },
				html_lsp = {},
				superhtml = {},
				eslint = {},
				--csharp_ls = {},
				capabilitiess_variables = {},
				--omnisharp_mono = {},
				vimls = {},
				luau_lsp = {},
				ts_ls = {},

				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`ts_ls`) will work just fine
				-- ts_ls = {},
				--
				-- Php Language Server
				-- phpactor = {},
				intelephense = {},

				-- laravel_ls = {},

				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			-- Now setup those configurations
			for name, config in pairs(servers) do
				local config = config or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for ts_ls)
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(name, config)
			end

			-- Ensure the servers and tools above are installed
			--
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
			})
		end,
	},
}

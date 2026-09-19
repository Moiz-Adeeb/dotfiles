-- return {
-- 	"shaunsingh/nord.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Configure options before loading the colorscheme
-- 		vim.g.nord_contrast = true
-- 		vim.g.nord_borders = true
-- 		vim.g.nord_disable_background = true -- Enables transparency
-- 		vim.g.nord_enable_sidebar_background = false
--
-- 		-- Load the colorscheme
-- 		vim.cmd([[colorscheme nord]])
-- 		-- Make floating windows and their borders completely transparent
-- 		local hl_groups = {
-- 			"NormalFloat", -- The main background of floating panels
-- 			"FloatBorder", -- The borders surrounding floating panels
-- 			"TelescopeNormal", -- Main background for Telescope search box
-- 			"TelescopeBorder", -- Borders for Telescope search box
-- 		}
--
-- 		for _, group in ipairs(hl_groups) do
-- 			vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
-- 		end
-- 	end,
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		flavour = "macchiato",
-- 		transparent_background = true,
-- 		terminal_colors = true,
-- 		styles = {
-- 			sidebars = "transparent",
-- 			--floats = "dark",
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("catppuccin").setup(opts)
-- 		vim.cmd([[colorscheme catppuccin]])
-- 	end,
-- }
--
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "night",
--     transparent = true,
--     terminal_colors = false,
--     styles = {
--       sidebars = "transparent",
--       floats = "dark",
--     },
--   },
--   config = function(_, opts)
--     require("tokyonight").setup(opts)
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
--
-- return {
--   "EdenEast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     options = {
--       -- Change this to your preferred flavor (see list below)
--       transparent = true,     -- Enable transparent background
--       terminal_colors = true, -- Set terminal colors (e.g. for :terminal)
--       styles = {
--         comments = "italic",  -- Style of comments
--         keywords = "bold",    -- Style of keywords
--         functions = "italic,bold", -- Multiple styles can be combined
--       },
--     },
--     groups = {
--       all = {
--         -- Set sidebar background to a solid color (bg1 is slightly lighter than bg0)
--         NvimTreeNormal = { bg = "palette.bg0" },
--         NvimTreeNormalNC = { bg = "palette.bg0" },
--         -- Ensure floating windows (like LSPs or Mason) stay solid
--         NormalFloat = { bg = "palette.bg0" },
--         FloatBorder = { fg = "palette.blue" },
--       },
--     },
--   },
--   config = function(_, opts)
--     require("nightfox").setup(opts)
--     vim.cmd("colorscheme carbonfox")
--   end,
-- }

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		options = {
-- 			transparent = true,
-- 			styles = {
-- 				sidebars = "default",
-- 			},
-- 			darken = {
-- 				sidebars = {
-- 					enable = true,
-- 					list = {
-- 						"qf",
-- 						"vista_kind",
-- 						"terminal",
-- 						"neo-tree",
-- 						"packer",
-- 						"spectre_panel",
-- 						"NeogitStatus",
-- 						"NvimTree",
-- 					},
-- 				},
-- 				floats = true,
-- 			},
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("github-theme").setup(opts)
-- 		vim.cmd("colorscheme github_dark_high_contrast")
-- 	end,
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority=1000,
--   opts = {
--     flavour = "mocha",
--     transparent_background = true,
--     integrations = {
--       neotree = true,
--       nvimtree = true,
--     },
--     custom_highlights = function(colors)
--       return {
--         NvimTreeNormal = { bg = colors.mantle }, -- Manually set a solid color for the sidebar
--         NvimTreeNormalNC = { bg = colors.mantle, style = {} },
--         NvimTreeWinSeparator = { fg = colors.base, bg = colors.mantle },
--         NeoTreeNormalNC = { bg = colors.mantle },
--         NeoTreeNormal = { bg = colors.mantle, style = {} },
--         NeoTreeWinSeparator = { fg = colors.base, bg = colors.mantle },
--       }
--     end,
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--       vim.cmd([[colorscheme catppuccin]])
--   end
-- }

-- return {
-- 	"bluz71/vim-nightfly-colors",
-- 	name = "nightfly",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme nightfly")
-- 	end,
-- }

-- return {
-- 	"scottmckendry/cyberdream.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme cyberdream")
-- 	end,
-- }

-- return {
-- 	"nikita-edel/sugarpunk.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme sugarpunk")
-- 	end,
-- }

-- return {
-- 	"ramojus/mellifluous.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("mellifluous").setup({
-- 			dim_inactive = false,
-- 			color_set = "modus", -- Renders ultra high-contrast colors
-- 		})
-- 		vim.cmd("colorscheme mellifluous")
-- 	end,
-- }

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").setup({
-- 			transparent_bg = true, -- Removes the main window background
-- 			line_numbers = {
-- 				bg = "NONE",
-- 			},
--
-- 			-- Force strict contrast overrides onto the parser tokens
-- 			override = {
-- 				-- Make floating panels fully transparent
-- 				NormalFloat = { bg = "NONE" },
-- 				FloatBorder = { fg = "#88C0D0", bg = "NONE" }, -- Vivid cyan border for LSP popups
--
-- 				-- High Contrast Syntax Tweaks for C# and TypeScript
-- 				["@keyword"] = { fg = "#81A1C1", bold = true }, -- Bright structural keywords
-- 				["@type"] = { fg = "#8FBCBB", bold = true }, -- Bold C# classes & TS interfaces
-- 				["@type.builtin"] = { fg = "#8FBCBB", bold = true },
-- 				["@function"] = { fg = "#88C0D0", bold = true }, -- Punchy C# methods & functions
-- 				["@variable"] = { fg = "#E5E9F0" }, -- Off-white variables for crisp text contrast
-- 				["@string"] = { fg = "#A3BE8C", italic = true }, -- Saturated, distinct string colors
--
-- 				-- High Contrast Fixes for Angular/HTML Templates
-- 				["@tag"] = { fg = "#81A1C1", bold = true }, -- Sharp HTML tags (div, app-root, etc.)
-- 				["@tag.delimiter"] = { fg = "#E5E9F0", bold = true }, -- Highly visible '<' and '>' brackets
-- 				["@tag.attribute"] = { fg = "#D8DEE9" }, -- Crisp property names
--
-- 				-- Brighten up comments so they don't fade into the void
-- 				["@comment"] = { fg = "#5E81AC", italic = true }, -- Brighter slate-blue comments
-- 				["LineNr"] = { fg = "#D8DEE9", bold = true }, -- High visibility active/inactive line numbers
-- 				["CursorLineNr"] = { fg = "#EBCB8B", bold = true }, -- Glowing gold active line number
-- 			},
-- 		})
-- 		require("nordic").load()
-- 	end,
-- }

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").setup({
-- 			transparent = {
-- 				bg = true,
-- 			},
--
-- 			line_numbers = {
-- 				bg = "NONE",
-- 			},
--
-- 			on_highlight = function(highlights, _)
-- 				-- Main UI Configurations
-- 				highlights.NormalFloat = { bg = "NONE" }
-- 				highlights.FloatBorder = { fg = "#88C0D0", bg = "NONE" }
--
-- 				-- High Contrast Syntax (C# and general)
-- 				highlights["@keyword"] = { fg = "#81A1C1", bold = true }
-- 				highlights["@function"] = { fg = "#88C0D0", bold = true }
-- 				highlights["@variable"] = { fg = "#E5E9F0" }
-- 				highlights["@string"] = { fg = "#AFFE8C", italic = true }
--
-- 				-- ==========================================================================
-- 				-- FIX: Razor-Sharp Contrast for TypeScript Types & Classes
-- 				-- ==========================================================================
-- 				-- Standard Tree-sitter Type highlight
-- 				highlights["@type"] = { fg = "#8FBCBB", bold = true } -- Soft, clean teal
-- 				highlights["@type.builtin"] = { fg = "#8FBCBB", bold = true }
--
-- 				-- High-priority LSP Semantic Token overrides (Stops fading on LSP load)
-- 				highlights["@lsp.type.class"] = { fg = "#8FBCBB", bold = true }
-- 				highlights["@lsp.type.interface"] = { fg = "#8FBCBB", bold = true, italic = true } -- Slanted interfaces for distinction
-- 				highlights["@lsp.type.type"] = { fg = "#8FBCBB", bold = true }
--
-- 				-- High Contrast Fixes for Angular/HTML Templates
-- 				highlights["@tag"] = { fg = "#81A1C1", bold = true }
-- 				highlights["@tag.delimiter"] = { fg = "#E5E9F0", bold = true }
-- 				highlights["@tag.attribute"] = { fg = "#D8DEE9" }
--
-- 				-- Utilities
-- 				-- highlights["@comment"] = { fg = "#FE81AC", italic = true }
-- 				local comment_style = { fg = "#FE81AC", italic = true }
--
-- 				highlights["Comment"] = comment_style -- Native Vim baseline group
-- 				highlights["@comment"] = comment_style -- Tree-sitter generic group
-- 				highlights["@comment.documentation"] = comment_style -- C# /// XML summary definitions
-- 				highlights["@comment.line"] = comment_style -- Explicit single line comment rule
-- 				highlights["@comment.block"] = comment_style -- Explicit multi-line block comment rule
--
-- 				-- LSP Semantic overrides for comments
-- 				highlights["@lsp.type.comment"] = comment_style
-- 				highlights["@lsp.type.comment.csharp"] = comment_style
-- 				highlights.LineNr = { fg = "#4C566A", bold = true }
-- 				highlights.CursorLineNr = { fg = "#EBCB8B", bold = true }
-- 			end,
-- 		})
--
-- 		require("nordic").load()
-- 	end,
-- }

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").setup({
-- 			transparent = {
-- 				bg = true, -- Removes the main window background
-- 			},
--
-- 			line_numbers = {
-- 				bg = "NONE",
-- 			},
--
-- 			on_highlight = function(highlights, _)
-- 				-- Make floating panels fully transparent
-- 				highlights.NormalFloat = { bg = "NONE" }
-- 				highlights.FloatBorder = { fg = "#88C0D0", bg = "NONE" } -- Vivid cyan border for LSP popups
--
-- 				-- High Contrast Syntax Tweaks for C# and TypeScript
-- 				highlights["@keyword"] = { fg = "#81A1C1", bold = true } -- Bright blue-grey structural keywords
-- 				highlights["@type"] = { fg = "#8FBCBB", bold = true } -- Bold teal for C# classes & TS interfaces
-- 				highlights["@type.builtin"] = { fg = "#8FBCBB", bold = true }
-- 				highlights["@function"] = { fg = "#88C0D0", bold = true } -- Clear cyan for functions/methods
-- 				highlights["@variable"] = { fg = "#E5E9F0" } -- Off-white text for main variables
-- 				highlights["@string"] = { fg = "#A3BE8C", italic = true } -- Saturated green strings
--
-- 				-- High Contrast Fixes for Angular/HTML Templates
-- 				highlights["@tag"] = { fg = "#81A1C1", bold = true } -- Sharp structural HTML tags
-- 				highlights["@tag.delimiter"] = { fg = "#E5E9F0", bold = true } -- Bright structural brackets '<' and '>'
-- 				highlights["@tag.attribute"] = { fg = "#D8DEE9", italic = true } -- Clear properties
--
-- 				-- High contrast utilities
-- 				highlights["@comment"] = { fg = "#5E81AC", italic = true } -- Bright slate blue for readable comments
-- 				highlights.LineNr = { fg = "#4C566A", bold = true } -- Gutter line numbers
-- 				highlights.CursorLineNr = { fg = "#EBCB8B", bold = true } -- Glowing gold active line number
-- 			end,
-- 		})
--
-- 		require("nordic").load()
-- 	end,
-- }

return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent = {
				bg = true, -- Inherits your terminal's jet-black canvas background
			},

			line_numbers = {
				bg = "NONE",
			},

			on_highlight = function(highlights, _)
				-- ==========================================================================
				-- 1. Precise Code Base Text Colors (From your screenshots)
				-- ==========================================================================
				local amber_orange = "#D19A66" -- The warm orange-yellow tag/keyword color
				local matrix_green = "#A3BE8C" -- The distinct glowing green string color
				local text_mint = "#E5E9F0" -- The crisp off-white for regular logic text
				local deep_forest = "#5E81AC" -- Muted tone for properties/attributes

				-- ==========================================================================
				-- 2. Core Code Token Controls
				-- ==========================================================================
				highlights["@keyword"] = { fg = amber_orange, bold = true } -- import, from, return, type
				highlights["@function"] = { fg = text_mint, bold = true } -- Methods & structural functions
				highlights["@variable"] = { fg = text_mint } -- Main code words & variables
				highlights["@string"] = { fg = matrix_green } -- Exact matrix-green string literals

				-- C# / TypeScript Core System Types (Stark White Highlights)
				local stark_type = { fg = "#FFFFFF", bold = true }
				highlights["@type"] = stark_type
				highlights["@type.builtin"] = stark_type
				highlights["@lsp.type.class"] = stark_type
				highlights["@lsp.type.interface"] = { fg = "#FFFFFF", bold = true, italic = true }
				highlights["@lsp.type.type"] = stark_type

				-- ==========================================================================
				-- 3. Angular & HTML Template Rules (Matches Image 1 Exactly)
				-- ==========================================================================
				highlights["@tag"] = { fg = amber_orange } -- <div, <app-dropdown, <form
				highlights["@tag.delimiter"] = { fg = text_mint } -- The brackets '<' and '>'
				highlights["@tag.attribute"] = { fg = text_mint } -- type, width, fontSize, style properties
				highlights["@property"] = { fg = text_mint } -- Nested template property names

				-- ==========================================================================
				-- 4. Global Comment Override (Hot Pink Exception Ruleset)
				-- ==========================================================================
				local pink_comment = { fg = "#FE81AC", italic = true }
				highlights["Comment"] = pink_comment
				highlights["@comment"] = pink_comment
				highlights["@comment.documentation"] = pink_comment
				highlights["@lsp.type.comment"] = pink_comment
				highlights["@comment.line"] = pink_comment

				-- ==========================================================================
				-- 5. Editor UI Alignment
				-- ==========================================================================
				highlights.NormalFloat = { bg = "NONE" }
				highlights.FloatBorder = { fg = matrix_green, bg = "NONE" }
				highlights.LineNr = { fg = "#4C566A", bold = true }
				highlights.CursorLineNr = { fg = amber_orange, bold = true }
			end,
		})

		require("nordic").load()
	end,
}

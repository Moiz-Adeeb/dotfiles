-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = "mocha",
--     transparent_background = true,
--     terminal_colore = true,
--     styles = {
--       --sidebars = "dark",
--       --floats = "dark",
--     },
--   },
--   --init = function()
--     --vim.cmd.colorscheme "tokyonight-night"
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--     vim.cmd([[colorscheme catppuccin]])
--   end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "night",
--     transparent = true,
--     terminal_colors = true,
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



return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      -- Change this to your preferred flavor (see list below)
      transparent = true,     -- Enable transparent background
      terminal_colors = true, -- Set terminal colors (e.g. for :terminal)
      styles = {
        comments = "italic",  -- Style of comments
        keywords = "bold",    -- Style of keywords
        functions = "italic,bold", -- Multiple styles can be combined
      },
    },
    groups = {
      all = {
        -- Set sidebar background to a solid color (bg1 is slightly lighter than bg0)
        NvimTreeNormal = { bg = "palette.bg0" },
        NvimTreeNormalNC = { bg = "palette.bg0" },
        -- Ensure floating windows (like LSPs or Mason) stay solid
        NormalFloat = { bg = "palette.bg0" },
        FloatBorder = { fg = "palette.blue" },
      },
    },
  },
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd("colorscheme carbonfox") 
  end,
}



-- return {
--   "projekt0n/github-nvim-theme",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     options = {
--       transparent = true,     -- Disable background colors
--       styles = {
--         sidebars = "dark",
--         floats = "dark",      -- Keeps popups readable
--       },
--     },
--   },
--   config = function(_, opts)
--     require("github-theme").setup(opts)
--     -- You can swap "github_dark" for any flavor below
--     vim.cmd("colorscheme github_dark_high_contrast")
--   end,
-- }


-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme", -- Explicitly naming it is a good habit for this plugin
--   lazy = false,
--   priority = 1000,
--   opts = {
--     options = {
--       transparent = true,
--       dim_inactive = false,
--       module_default = true,
--       styles = {
--         sidebars = "dark",
--       },
--       darken = {
--         sidebars = {
--           enable = true,
--           list = {"NvimTree"}, -- You can list specific sidebars like {"qf", "packer"} here
--         },
--         floats = true, -- This makes floating windows darker than the main editor
--       },
--     },
--   },
--   config = function(_, opts)
--     require("github-theme").setup(opts)
--     vim.cmd("colorscheme github_dark_high_contrast")
--  end,
-- }



-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     options = {
--       transparent = true,    -- Main editor stays transparent
--       styles = {
--         sidebars = "transparent", -- This is a text style; keep it default/transparent
--       },
--       darken = {
--         sidebars = {
--           enable = true,      -- THIS makes them solid/non-transparent
--           list = {
--             "qf",
--             "vista_kind",
--             "terminal",
--             "neo-tree",
--             "packer",
--             "spectre_panel",
--             "NeogitStatus",
--             "NvimTree",       -- Standard name for NvimTree
--           },
--         },
--         floats = true,
--       },
--     },
--   },
--   config = function(_, opts)
--     require("github-theme").setup(opts)
--     vim.cmd("colorscheme github_dark_high_contrast")
--   end,
-- }

    --vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#0d1117" }) -- Standard GH Dark BG
    --vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "#0d1117" })



-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
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
--         NeoTreeNormalNC = { bg = colors.mantle },
--       }
--     end,
--   },
--   config = function(_, opts)
--     require("catppuccin").setup(opts)
--       vim.cmd([[colorscheme catppuccin]])
--   end
-- }


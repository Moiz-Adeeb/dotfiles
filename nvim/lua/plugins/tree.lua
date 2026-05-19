return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Recommended: disable netrw (built-in explorer)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 40,
        side = "right",
      },
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "open",
        icons = {
          show = {
            git = true,
          },
        },
        group_empty = true,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
  keys = {
    { "<leader>e",  "<cmd>NvimTreeToggle<cr>",   desc = "Toggle File Explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in tree" },
  },
}

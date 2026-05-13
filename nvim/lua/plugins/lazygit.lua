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
  -- Optional: link to telescope if you use it
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Setting the keymap here
  keys = {
    -- { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  config = function()
    -- If you have Snacks.nvim installed:
    vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit() end, { desc = "Lazygit" })

    -- These are global vim variables used by the plugin
    vim.g.lazygit_floating_window_winblend = 0    -- 0 is opaque, 100 is transparent
    vim.g.lazygit_floating_window_use_plenary = 1 -- Better window handling
    vim.g.lazygit_use_neovim_remote = 1           -- Crucial for the 'e' key logic
  end,
}

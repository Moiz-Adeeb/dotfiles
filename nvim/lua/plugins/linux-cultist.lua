return {
  "linux-cultist/venv-selector.nvim",
  event = "VeryLazy",
  config = function()
    require("venv-selector").setup({
      -- optional: add options here
    })
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim", -- optional: if you want to use telescope picker
    "j-hui/fidget.nvim",             -- optional: for better UI
  }
}


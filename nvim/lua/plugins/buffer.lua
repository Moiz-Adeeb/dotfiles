return {
  { "famiu/bufdelete.nvim" },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
    config = function()
      require("bufferline").setup({
        options = {
          -- This makes sure the bufferline starts AFTER the nvim-tree sidebar
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })
    end,
    keys = {
      -- Shortcuts to switch between open files (buffers)
      { "<S-l>",     "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<S-h>",     "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      -- -- {
      --   "<leader>x",
      --   function()
      --     local bd = require("bufdelete").bufdelete
      --     -- This ensures we close the buffer, not the window/sidebar
      --     vim.cmd("bdelete!")
      --   end,
      --   desc = "Close Buffer"
      -- },
      -- Shortcut to close the current file (buffer)
      { "<leader>x", "<cmd>Bdelete<cr>",             desc = "Close Buffer" },
    },
  },
}

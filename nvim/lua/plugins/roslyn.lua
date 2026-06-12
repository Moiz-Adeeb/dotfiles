return {
  'seblyng/roslyn.nvim',
  ft = 'cs',
  opts = {
    -- Roslyn handles its own setup, so you don't need it in mason-lspconfig
    config = {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    },
  },
}


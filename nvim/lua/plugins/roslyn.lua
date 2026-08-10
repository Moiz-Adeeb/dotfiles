return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
        require("roslyn").setup({
            args = {
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_filename()),
                "--stdio",
            },
            config = {
                -- Pass your standard on_attach capabilities here
                on_attach = function(client, bufnr)
                    -- Your keymaps (e.g., gd for definition, K for hover)
                end,
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                    }
                }
            },
        })
    end,
}
-- return {
--   'seblyng/roslyn.nvim',
--   ft = 'cs',
--   opts = {
--     -- Roslyn handles its own setup, so you don't need it in mason-lspconfig
--     config = {
--       capabilities = require('blink.cmp').get_lsp_capabilities(),
--     },
--   },
-- }
--

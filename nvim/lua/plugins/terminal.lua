return {
  'akinsho/toggleterm.nvim',
  lazy = false,
  version = "*",
  config = function()
    require("toggleterm").setup({
        winbar = {
    enabled = true,
    name_formatter = function(term)
      -- Returns the custom name if set, otherwise just the ID
      return term.name or ("Terminal " .. term.id)
    end,
  },
      size = 15,
      open_mapping = [[<C-t>]], -- Use Ctrl+t to open/close
      hide_numbers = true,      -- No line numbers in terminal
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,       -- Makes the background slightly darker than your code
      start_in_insert = true,   -- Automatically enter insert mode when opened
      insert_mappings = true,   -- Whether open mapping applies in insert mode
      terminal_mappings = true, -- Whether open mapping applies in terminal mode
      persist_size = true,
      autopoint = true,
      persist_mode = true,
      direction = 'horizontal', -- Bottom of screen
      close_on_exit = true,     -- Close the window when the process (shell) exits
      shell = vim.o.shell,      -- Use your default system shell
      float_opts = {
        border = 'curved',      -- If you ever switch to 'float' direction
      },
    })

    -- Optional: If you specifically want Ctrl+t to toggle it:
    vim.keymap.set({ 'n', 't' }, '<C-t>', [[<Cmd>ToggleTerm<CR>]], { desc = 'Toggle Terminal' })
    -- Rename the current terminal (prompts for a name)
    vim.keymap.set({ 'n', 't' }, '<leader>tr', '<cmd>ToggleTermSetName<cr>', { desc = 'Rename Terminal' })

    -- Press <leader>tn to automatically open the NEXT available terminal
    -- Automatically find the next available ID and open a new terminal


    local terminal_count = 0
    vim.keymap.set({ 'n', 't' }, '<leader>tn', function()
      -- 1. Manually hide any visible ToggleTerm windows to prevent splitting
      local terminal_list = require("toggleterm.terminal").get_all()
      for _, term in ipairs(terminal_list) do
        if term:is_open() then
          term:close()
        end
      end

      -- 2. Increment the ID for the NEW terminal tab
      terminal_count = terminal_count + 1

      -- 3. Open the NEW terminal ID in the bottom horizontal slot
      vim.cmd(terminal_count .. "ToggleTerm direction=horizontal")
    end, { desc = 'New Terminal Tab (Force No-Split)' })


    -- Easier way to get out of terminal mode
    vim.keymap.set({ 'n', 't' }, '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    vim.keymap.set({ 'n', 't' }, 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

    -- These work while you are INSIDE the terminal
    vim.keymap.set({ 'n', 't' }, '<C-n>', [[<Cmd>wincmd w<CR>]], { desc = 'Go to next window' }) -- Jump out to code
    -- Or cycle terminals specifically:
    -- Cycle to the NEXT terminal tab without splitting
    vim.keymap.set({ 'n', 't' }, '<A-j>', function()
      local all_terms = require("toggleterm.terminal").get_all()
      if #all_terms == 0 then return end

      -- Hide all currently open windows
      for _, term in ipairs(all_terms) do
        if term:is_open() then term:close() end
      end

      -- This logic cycles to the next ID or back to 1
      terminal_count = (terminal_count % #all_terms) + 1
      vim.cmd(terminal_count .. "ToggleTerm")
    end, { desc = 'Cycle Next Terminal Tab' })

    -- Easy move from terminal back to code window
    vim.keymap.set({ 'n', 't' }, '<C-n>', [[<C-\><C-n><C-w>w]], { desc = 'Focus Code Window' })

    -- This opens a list of all your active terminals so you can pick one
    vim.keymap.set({ 'n', 't' }, '<leader>ts', '<cmd>TermSelect<cr>', { desc = 'Select Terminal' })
    -- Toggle a specific 'side' terminal for quick commands
    vim.keymap.set({ 'n', 't' }, '<leader>th', '<cmd>1ToggleTerm direction=horizontal<cr>', { desc = 'Terminal Horizontal' })
    vim.keymap.set({ 'n', 't' }, '<leader>tv', '<cmd>2ToggleTerm direction=vertical size=60<cr>', { desc = 'Terminal Vertical' })
    vim.keymap.set({ 'n', 't' }, '<leader>tf', '<cmd>3ToggleTerm direction=float<cr>', { desc = 'Terminal Float' })
  end
}

local function toggle_padding()
	-- If padding splits already exist, close them and return
	if vim.g.padding_active then
		vim.cmd("only") -- Closes all other splits, keeping just your main window
		vim.g.padding_active = false
		return
	end

	-- Calculate width: terminal is 190, code is 120, remaining is 70 (35 on each side)
	local padding_width = 30

	-- Helper function to configure a clean, unlisted scratch split
	local function make_scratch_padding()
		-- Create an unlisted buffer (true = scratch, true = unlisted)
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_win_set_buf(0, buf)

		-- Strip all UI clutter from the padding column
		vim.opt_local.buflisted = false
		vim.opt_local.buftype = "nofile"
		vim.opt_local.bufhidden = "wipe"
		vim.opt_local.statusline = " "
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.foldcolumn = "0"
	end

	-- 1. Create Left Padding Split
	vim.cmd("topleft vsplit")
	vim.cmd("vertical resize " .. padding_width)
	make_scratch_padding()

	-- Move back to the main right window, then create Right Padding Split
	vim.cmd("wincmd l")
	vim.cmd("botright vsplit")
	vim.cmd("vertical resize " .. padding_width)
	make_scratch_padding()

	-- Move cursor back to the center working window
	vim.cmd("wincmd h")
	vim.g.padding_active = true
end

-- Keybinding to toggle both-sides padding with 'zp' (Zen Padding)
vim.keymap.set("n", "zp", toggle_padding, { desc = "Toggle side padding" })

vim.opt.fillchars:append({ eob = " " })
vim.g.have_nerd_font = true

--#region Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false
--#endregion

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

--Use Spaces instad of taps
vim.opt.expandtab = true
-- size for spaces using << and >>
vim.opt.shiftwidth = 4
-- size for spaces for tab
vim.opt.tabstop = 4
-- how many spaces when prassing tab
vim.opt.softtabstop = 4

-- indetation opthions
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

vim.opt.laststatus = 3
vim.opt.cmdheight = 0

-- Draw a vertical line at 100 characters
vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

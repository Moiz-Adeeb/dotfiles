return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 0, -- Slightly dims the background outside the center column
			width = 120, -- Forces the centered code block to be exactly 120 characters wide
			height = 1, -- Takes up the full height of the terminal window
			options = {
				signcolumn = "yes", -- Hides git signs/diagnostics column for total focus
				number = true, -- Keeps line numbers on (set to false if you want them gone)
				relativenumber = false, -- Keeps regular numbers or turns off relative numbers
			},
		},
		plugins = {
			-- Keeps options clean; hides tmux statusline or nvim statuslines if desired
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
			},
			twilight = { enabled = true }, -- Dims surrounding text lines (turn on if you like it)
		},
	},

	-- Toggle Zen Mode using 'zn' in Normal Mode
	vim.keymap.set("n", "zn", ":ZenMode<CR>", { desc = "Toggle Zen Mode layout" }),
}

-- require("yatline"):setup()
local theme = require("yatline-catppuccin"):setup("mocha")
require("yatline"):setup({
    theme = theme,
    section_separator = { open = "", close = "" },
})
require("smart-enter"):setup({
	open_multi = true,
})

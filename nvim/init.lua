--[[
   ______          __     ____                 __  ______ 
  / ____/___  ____/ /__  / __ \____  _____    / / / / __ \
 / /   / __ \/ __  / _ \/ / / / __ \/ ___/   / /_/ / / / /
/ /___/ /_/ / /_/ /  __/ /_/ / /_/ (__  )   / __  / /_/ / 
\____/\____/\__,_/\___/\____/ .___/____/   /_/ /_/\___\_\ 
                           /_/


--]]
-- Force the path to use the correct Windows formatlocal treesitter_path = vim.fn.expand(vim.fn.stdpath("data") .. "/site")
-- Use the absolute path instead of the tilde (~) shortcut

require("config.options")
require("config.keymaps")
require("config.lazy")
--vim.opt.guicursor = "a:ver25"

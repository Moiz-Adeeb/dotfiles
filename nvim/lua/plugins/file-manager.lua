-- return {
-- 	"stevearc/oil.nvim",
-- 	opts = {},
-- 	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
-- 	keys = {
-- 		{
-- 			"-",
-- 			function()
-- 				require("oil").open_float()
-- 			end,
-- 			desc = "Open parent directory",
-- 		},
-- 	},
-- }
--
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional layout icons
  lazy = false,                                     -- Load early so it can hijack default directory views
  config = function()
    require("oil").setup({
      -- Customizes the columns shown in the file list layout
      columns = {
        "icon",
        --"permissions",
        --"size",
      },
      -- Keymaps internal to the Oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",    -- Open file or folder
        ["<Right>"] = "actions.select", -- Down into folder / open file
        ["<Left>"] = "actions.parent",  -- Up into parent directory
        ["l"] = "actions.select",       -- Down into folder / open file
        ["h"] = "actions.parent",       -- Up into parent directory
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
        ["-"] = "actions.parent",   -- Go up a directory level
        ["_"] = "actions.open_cwd", -- Open current working directory
        ["a"] = {
          desc = "Create new file or folder silently",
          callback = function()
            vim.ui.input({ prompt = "Create new file/folder: " }, function(name)
              if not name or name == "" then return end

              -- Add the text name to the current line in the file list
              vim.api.nvim_put({ name }, "l", true, true)

              -- Trigger the internal silent save API directly
              require("oil").save({ confirm = false })
            end)
          end,
        },
      },
      -- Set to false if you don't want it to completely replace netrw
      default_file_explorer = true,
      view_options = {
        -- Show files that start with a dot (hidden files)
        show_hidden = true,
      },
      skip_confirm_all = true,
      --prompt_save_on_select_new_entry = false,
    })

    -- Global keybinding to open Oil from anywhere in Neovim
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })
    vim.keymap.set("n", "f", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.keymap.set("n", "a", function()
          -- Open a clean internal prompt input box
          vim.ui.input({ prompt = "Create new file/folder: " }, function(name)
            if not name or name == "" then return end

            -- Insert the text name into the buffer on a clean line
            vim.api.nvim_put({ name }, "l", true, true)

            -- Save immediately to commit the file creation to disk
            vim.cmd("write")
          end)
        end, { buffer = true, desc = "Create new file or folder" })
      end,
    })
  end,
}

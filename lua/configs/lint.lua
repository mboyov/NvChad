-- Import the 'lint' module to configure linting for various file types
local lint = require("lint")

-- Define linters to be used for specific file types
lint.linters_by_ft = {
    lua = { "luacheck" }, -- Use 'luacheck' as the linter for Lua files
}

-- Configure the arguments to be passed to the 'luacheck' linter
lint.linters.luacheck.args = {
    "--globals", -- Specify global variables to ignore
    "love", -- Add 'love' as a global (for Love2D development)
    "vim", -- Add 'vim' as a global (for Neovim development)
    "--formatter", -- Set the output format of the linter
    "plain", -- Use plain text format for linter output
    "--codes", -- Show the diagnostic codes in the output
    "--ranges", -- Show the code ranges for warnings and errors
    "-", -- Read input from stdin (necessary for Neovim integration)
}

-- Create an autocommand to trigger linting automatically on specific events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    -- This callback will try to lint the buffer whenever these events are triggered:
    -- - BufEnter: when entering the buffer
    -- - BufWritePost: after writing to the buffer
    -- - InsertLeave: when exiting insert mode
    callback = function()
        lint.try_lint() -- Try to lint the current buffer
    end,
})

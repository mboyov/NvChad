-- Import the 'lint' module to set up linting for different file types
local lint = require("lint")

-- Specify linters for each file type
lint.linters_by_ft = {
    lua = { "luacheck" }, -- Use 'luacheck' for Lua files
    sh = { "shellcheck" }, -- Use 'shellcheck' for shell scripts
    php = { "phpcs" }, -- Use 'phpcs' for PHP files
    javascript = { "eslint_d" }, -- Use 'eslint_d' for JavaScript files
    typescript = { "eslint_d" }, -- Use 'eslint_d' for TypeScript files
    python = { "flake8", "pylint" }, -- Use 'flake8' and 'pylint' for Python files
    yaml = { "yamllint" }, -- Use 'yamllint' for YAML files
    dockerfile = { "hadolint" }, -- Use 'hadolint' for Dockerfiles
    json = { "jsonlint" }, -- Use 'jsonlint' for JSON files
}

-- Define specific arguments to be passed to the 'luacheck' linter
lint.linters.luacheck.args = {
    "--globals", -- Ignore specified global variables
    "love", -- Add 'love' as a global (commonly used in Love2D projects)
    "vim", -- Add 'vim' as a global (used in Neovim-related scripts)
    "--formatter", -- Set the output format for luacheck
    "plain", -- Use plain text output format
    "--codes", -- Show error/warning codes in the output
    "--ranges", -- Display code ranges where warnings or errors occur
    "-", -- Read input from stdin (required for Neovim integration)
}

-- Create an autocommand to automatically lint files on certain events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    -- The callback triggers linting when entering a buffer, saving changes, or leaving insert mode
    callback = function()
        lint.try_lint() -- Attempt to lint the current buffer
    end,
})

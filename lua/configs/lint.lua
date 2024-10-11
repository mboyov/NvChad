-- Import the 'lint' module to set up linting for different file types
local lint = require("lint")

-- Specify linters for each file type
lint.linters_by_ft = {
    lua = { "luacheck" }, -- Use 'luacheck' for linting Lua files
    sh = { "shellcheck" }, -- Use 'shellcheck' for linting shell scripts
    php = { "phpcs" }, -- Use 'phpcs' for PHP linting
    javascript = { "eslint_d" }, -- Use 'eslint_d' for JavaScript linting
    typescript = { "eslint_d" }, -- Use 'eslint_d' for TypeScript linting
    python = { "flake8", "pylint" }, -- Use both 'flake8' and 'pylint' for Python linting
    html = { "stylelint" }, -- Use 'stylelint' for HTML linting
    css = { "stylelint" }, -- Use 'stylelint' for CSS linting
    yaml = { "yamllint" }, -- Use 'yamllint' for YAML linting
    dockerfile = { "hadolint" }, -- Use 'hadolint' for Dockerfile linting
    json = { "jsonlint" }, -- Use 'jsonlint' for JSON linting
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

-- Configure specific arguments for Stylelint
lint.linters.stylelint = {
    cmd = "npx stylelint", -- Command to run Stylelint
    args = {
        "--stdin", -- Read input from stdin (required for Neovim integration)
        "--stdin-filename",
        "%:p", -- Specify the filename (used for resolving configurations)
        "--fix", -- Apply automatic fixes if possible
    },
    stdin = true, -- Read from stdin
}

-- Create an autocommand to automatically lint files on certain events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    -- The callback triggers linting when the following events happen:
    -- - BufEnter: when entering a buffer
    -- - BufWritePost: after saving changes to a file
    -- - InsertLeave: when leaving insert mode
    callback = function()
        lint.try_lint() -- Attempt to lint the current buffer
    end,
})

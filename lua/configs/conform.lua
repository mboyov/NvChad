-- Conform.lua - Simplified configuration for formatters

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" }, -- Stylua respects .stylua.toml configuration
        python = { "black" }, -- Black with default configuration
        php = { "php-cs-fixer" }, -- PHP-CS-Fixer with default rules
        sh = { "shfmt" }, -- Shell formatter
        sql = { "sqlfmt" }, -- SQL formatter

        -- Prettier with custom options for specific file types
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
    },
    format_on_save = true, -- Format files on save
    timeout_ms = 1000, -- Timeout to handle large files
    lsp_fallback = true, -- Use LSP if no specific formatter is configured

    -- Global formatter configuration
    formatters = {
        prettier = {
            command = "prettier", -- Ensure it's the right path in your system
            args = {
                "--tab-width", "4", -- Set tab width to 4
                "--use-tabs", -- Use tabs instead of spaces
                "--single-quote", -- Use single quotes
                "--trailing-comma", "es5", -- Trailing commas in ES5 style
            },
        },
    },
})

return conform

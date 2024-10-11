-- Conform.lua - Configuration for formatters for different languages

-- Function to apply prettier to multiple languages
local function apply_prettier_to_languages(languages)
    local formatters = {}
    for _, lang in ipairs(languages) do
        formatters[lang] = { "prettier" } -- Apply prettier with default configuration
    end
    return formatters
end

-- Languages that should use prettier
local prettier_languages = { "javascript", "typescript", "html", "css", "yaml", "json" }

-- Configuration table for conform.nvim
local options = {
    -- Specify formatters for each file type (ft)
    formatters_by_ft = vim.tbl_extend("force", {
        -- Use "stylua" to format Lua files
        lua = { "stylua" },

        -- Use "black" and "isort" to format and sort imports in Python files
        python = { "black", "isort" },

        -- Use "phpcsfixer" to format PHP files
        php = { "phpcsfixer" },

        -- Use "shfmt" to format Shell scripts
        sh = { "shfmt" },

        -- Add other formatters here if needed
    }, apply_prettier_to_languages(prettier_languages)),

    -- Formatting on save
    format_on_save = {
        timeout_ms = 1000, -- Increase timeout to avoid issues with large files
        lsp_fallback = true, -- Use LSP formatter if no specific formatter is configured
    },

    -- You could also add configuration options for specific formatters here
    formatter_options = {
        black = { extra_args = { "--line-length", "88" } }, -- Custom black configuration
        prettier = { extra_args = { "--single-quote", "--trailing-comma", "es5" } }, -- Prettier options
    },
}

-- Return the options table to be used by other modules or configurations
return options

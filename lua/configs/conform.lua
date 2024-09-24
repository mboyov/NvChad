-- Conform.lua - Configuration for formatters for different languages

-- Function to apply prettier to multiple languages
local function apply_prettier_to_languages(languages)
    local formatters = {}
    for _, lang in ipairs(languages) do
        formatters[lang] = { "prettier" }
    end
    return formatters
end

-- Languages that should use prettier
local prettier_languages = { "javascript", "typescript", "html", "css", "yaml", "json" }

-- Table containing the configuration options for conform.nvim
local options = {
    -- Specify formatters for each file type (ft)
    formatters_by_ft = vim.tbl_extend("force", {
        -- Use "stylua" to format Lua files
        lua = { "stylua" },

        -- Use "black" to format Python files
        python = { "black" },

        -- Use the LSP "intelephense" to format PHP files
        php = { "intelephense" },

        -- Add other formatters here if needed for other languages
    }, apply_prettier_to_languages(prettier_languages)),

    -- Configuration for formatting on save
    format_on_save = {
        -- Set a timeout for the formatting process (in milliseconds)
        timeout_ms = 500,

        -- Use LSP formatter if no specific formatter is configured
        lsp_fallback = true,
    },
}

-- Return the options table to be used by other modules or configurations
return options

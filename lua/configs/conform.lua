-- Conform.lua - Configuration for formatters for different languages

-- Function to apply custom options to formatters (except Stylua)
local function apply_custom_formatters(languages, formatter, extra_args)
    local formatters = {}
    for _, lang in ipairs(languages) do
        formatters[lang] = {
            formatter,
            extra_args = extra_args, -- Apply custom options
        }
    end
    return formatters
end

-- Languages that should use Prettier
local prettier_languages = { "javascript", "typescript", "html", "css", "yaml", "json" }

-- Custom configuration options for Prettier
local prettier_options = {
    "--tab-width",
    "4", -- Set tab width to 4
    "--use-tabs", -- Use tabs instead of spaces
    "--single-quote", -- Use single quotes
    "--trailing-comma",
    "es5", -- Add trailing commas in ES5 style
}

-- Formatter configuration via conform.nvim
local options = {
    -- Specify formatters for each file type
    formatters_by_ft = vim.tbl_extend("force", {
        -- Use Stylua to format Lua files (respecting .stylua.toml configuration)
        lua = { "stylua" }, -- Stylua will use its .stylua.toml configuration

        -- Use "black" to format Python files
        python = {
            "black",
            extra_args = { "--line-length", "88" }, -- Specific options for Black
        },

        -- Use "php-cs-fixer" to format PHP files
        php = {
            "php-cs-fixer",
            extra_args = { "--rules=@PSR2" }, -- Specific options for PHP-CS-Fixer
        },

        -- Use "shfmt" to format Shell scripts
        sh = { "shfmt" },

        -- Use "sqlfmt" to format SQL files
        sql = { "sqlfmt" },
    }, apply_custom_formatters(prettier_languages, "prettier", prettier_options)), -- Apply Prettier with custom options

    -- Format on save
    format_on_save = {
        timeout_ms = 1000, -- Increased timeout to handle large files
        lsp_fallback = true, -- Use LSP formatter if no specific formatter is configured
    },
}

-- Return the options table
return options

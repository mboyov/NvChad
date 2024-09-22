local options = {
    -- Specify formatters for each file type (ft)
    formatters_by_ft = {
        lua = { "stylua" }, -- Use "stylua" to format Lua files
        -- css = { "prettier" },  -- Uncomment to use "prettier" for CSS files
        -- html = { "prettier" }, -- Uncomment to use "prettier" for HTML files
    },

    -- -- Define custom formatters (if needed)
    -- formatters = {
    --     -- stylua = {},    -- Add custom settings for the Stylua formatter
    --     -- prettier = {},  -- Add custom settings for the Prettier formatter
    -- },

    -- Configuration for formatting on save
    format_on_save = {
        -- Options passed to the conform.format() function
        timeout_ms = 500, -- Set timeout for the formatting process in milliseconds
        lsp_fallback = true, -- Use LSP formatter if no specific formatter is configured
    },
}

-- Return the options table to be used by other modules or configurations
return options

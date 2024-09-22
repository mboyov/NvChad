-- Define Treesitter options for supported languages and features
local options = {
    -- List of languages for which Treesitter parsers should be installed
    ensure_installed = {
        "bash", -- Bash scripting language
        "fish", -- Fish shell scripting language
        "lua", -- Lua programming language
        "luadoc", -- Lua documentation parser
        "markdown", -- Markdown formatting language
        "printf", -- Printf formatting language
        "toml", -- TOML configuration language
        "vim", -- Vim script language
        "vimdoc", -- Vim documentation parser
        "yaml", -- YAML configuration language
    },

    -- Syntax highlighting configuration
    highlight = {
        enable = true, -- Enable Treesitter-based syntax highlighting
        use_languagetree = true, -- Use the language tree for better parsing
    },

    -- Indentation configuration
    indent = { enable = true }, -- Enable Treesitter-based indentation
}

-- Apply the Treesitter configuration using the defined options
require("nvim-treesitter.configs").setup(options)

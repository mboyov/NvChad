-- Define Treesitter options for supported languages and features
local options = {
    -- List of languages for which Treesitter parsers should be installed
    ensure_installed = {
        "bash", -- Bash scripting language
        "lua", -- Lua programming language
        "luadoc", -- Lua documentation parser
        "markdown", -- Markdown formatting language
        "printf", -- Printf formatting language
        "toml", -- TOML configuration language
        "vim", -- Vim script language
        "vimdoc", -- Vim documentation parser
        "yaml", -- YAML configuration language
        "html",
        "css",
        "dockerfile",
        "gpg",
        "htmldjango",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "make",
        "nginx",
        "php",
        "phpdoc",
        "powershell",
        "python",
        "regex",
        "scss",
        "sql",
        "ssh_config",
        "tmux",
        "typescript",
        "xml",
        "ini",
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

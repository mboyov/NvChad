return {
    -- Treesitter for syntax highlighting and code parsing
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" }, -- Load when opening a file or buffer
        config = function()
            require("configs.treesitter") -- Load custom treesitter configuration
        end,
    },

    -- Neovim LSP configuration for language server support
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Load when editing a file
        config = function()
            -- Load NvChad's default LSP settings first
            require("nvchad.configs.lspconfig").defaults()
            -- Load custom LSP configurations
            require("configs.lspconfig")
        end,
    },

    -- Mason plugin for managing LSP servers automatically
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy", -- Load only when required
        dependencies = { "nvim-lspconfig" }, -- Ensure lspconfig is loaded before this plugin
        config = function()
            require("configs.mason-lspconfig") -- Load Mason-specific LSP settings
        end,
    },

    -- Linter integration for Neovim
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" }, -- Lint when files are opened or created
        config = function()
            require("configs.lint") -- Custom linter configurations
        end,
    },

    -- Mason integration for nvim-lint to auto-install linters
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy", -- Load linters lazily to improve startup
        dependencies = { "nvim-lint" }, -- Ensure nvim-lint is available first
        config = function()
            require("configs.mason-lint") -- Custom Mason-lint setup
        end,
    },

    -- Formatter plugin (Conform) for auto-formatting on save
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- Auto-format on save
        opts = require("configs.conform"), -- Use custom configuration for formatting
    },

    -- Mason integration for Conform to auto-install formatters
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy", -- Load when needed to keep the startup fast
        dependencies = { "conform.nvim" }, -- Ensure Conform is available first
        config = function()
            require("configs.mason-conform") -- Custom setup for Mason with Conform
        end,
    },

    -- Neovim and tmux navigation
    {
        "christoomey/vim-tmux-navigator",
        lazy = false, -- Load immediately to avoid navigation conflicts
        config = function()
            -- No additional configuration needed as the plugin works out of the box
        end,
    },

    -- Load 'trouble.nvim' plugin, which provides a diagnostics list and quickfix management
    {
        "folke/trouble.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- Lint diagnostics will be triggered on these events
        -- 'trouble.nvim' depends on 'nvim-web-devicons' for file icons in the diagnostics list
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.trouble")
        end,
    },

    -- Live Preview Plugin
    {
        "brianhuster/live-preview.nvim",
        dependencies = { "brianhuster/autosave.nvim" }, -- Optional dependency for autosaving
        event = { "BufReadPre", "BufNewFile" }, -- Load when opening or creating a file
        config = function()
            require("configs.live-preview") -- Load custom live-preview configuration
        end,
    },

    {
        "echasnovski/mini.icons",
        version = false,
    },

    -- Noice Plugin
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("configs.noice")
        end,
    },
}

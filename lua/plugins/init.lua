return {
    -- Treesitter for syntax highlighting and code parsing
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" }, -- Load Treesitter when opening a file or buffer
        config = function()
            require("configs.treesitter") -- Load custom Treesitter configuration
        end,
    },

    -- Neovim LSP configuration for language server support
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Load LSP configuration when editing a file
        config = function()
            -- Load default LSP settings from NvChad
            require("nvchad.configs.lspconfig").defaults()
            -- Load custom LSP configurations
            require("configs.lspconfig")
        end,
    },

    -- Mason plugin for managing LSP servers automatically
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy", -- Load lazily to optimize startup performance
        dependencies = { "nvim-lspconfig" }, -- Ensure LSP configuration is loaded first
        config = function()
            require("configs.mason-lspconfig") -- Load custom Mason-specific LSP settings
        end,
    },

    -- Linter integration for Neovim
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" }, -- Trigger linting when files are opened or created
        config = function()
            require("configs.lint") -- Load custom linter configurations
        end,
    },

    -- Mason integration for nvim-lint to auto-install linters
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy", -- Load lazily to optimize performance
        dependencies = { "nvim-lint" }, -- Ensure nvim-lint is loaded first
        config = function()
            require("configs.mason-lint") -- Load custom Mason-lint configuration
        end,
    },

    -- Formatter plugin (Conform) for auto-formatting on save
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- Auto-format files before saving
        opts = require("configs.conform"), -- Use custom formatting configuration
    },

    -- Mason integration for Conform to auto-install formatters
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy", -- Load when needed to keep the startup fast
        dependencies = { "conform.nvim" }, -- Ensure Conform is loaded first
        config = function()
            require("configs.mason-conform") -- Load custom Mason-Conform configuration
        end,
    },

    -- Neovim and tmux pane navigation
    {
        "christoomey/vim-tmux-navigator",
        lazy = false, -- Load immediately to prevent conflicts in navigation between Neovim and tmux
        config = function()
            -- No additional configuration is required as it works out of the box
        end,
    },

    -- Trouble.nvim for diagnostics list and quickfix management
    {
        "folke/trouble.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- Trigger diagnostics loading on these events
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Use icons from nvim-web-devicons
        config = function()
            require("configs.trouble") -- Load custom configuration for Trouble
        end,
    },

    -- Live Preview Plugin for real-time updates
    {
        "brianhuster/live-preview.nvim",
        dependencies = { "brianhuster/autosave.nvim" }, -- Optional dependency for autosaving
        event = { "BufReadPre", "BufNewFile" }, -- Load when opening or creating a file
        config = function()
            require("configs.live-preview") -- Load custom live-preview configuration
        end,
    },

    -- Minimal icon integration plugin
    {
        "echasnovski/mini.icons",
        version = false, -- Load latest version without version constraints
    },

    -- Noice Plugin for better notifications and UI enhancements
    {
        "folke/noice.nvim",
        event = "VeryLazy", -- Load lazily to optimize startup
        dependencies = {
            "MunifTanjim/nui.nvim", -- UI components library
            "rcarriga/nvim-notify", -- Notification plugin for Neovim
        },
        config = function()
            require("configs.noice") -- Load custom Noice configuration
        end,
    },
}

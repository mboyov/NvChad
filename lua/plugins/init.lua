return {
    -- Treesitter for syntax highlighting and code parsing
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" }, -- Load Treesitter when opening a file or creating a new buffer
        config = function()
            require("configs.treesitter") -- Load custom Treesitter configuration
        end,
    },

    -- Neovim LSP configuration for language server support
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Load LSP configuration when editing a file or creating a new buffer
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
        event = "VeryLazy", -- Load when needed to keep the startup fast
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Use icons from nvim-web-devicons
        config = function()
            require("configs.trouble") -- Load custom configuration for Trouble
        end,
    },

    -- Live Preview Plugin for real-time updates
    {
        "brianhuster/live-preview.nvim",
        dependencies = { "brianhuster/autosave.nvim" }, -- Optional dependency for autosaving
        event = "VeryLazy", -- Load lazily to avoid unnecessary startup overhead
        config = function()
            require("configs.live-preview") -- Load custom live-preview configuration
        end,
    },

    -- Minimal icon integration plugin
    {
        "echasnovski/mini.icons",
        event = "VeryLazy",
        version = false, -- Load the latest version without version constraints
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
            require("configs.noice") -- Load detailed Noice configuration
        end,
    },

    -- Pane resizer plugin for Neovim
    {
        "mboyov/pane-resizer.nvim",
        event = "WinEnter", -- Load when entering a window
        config = function()
            require("configs.pane-resizer") -- Load custom configuration for pane-resizer
        end,
    },

    -- Install fzf-lua with LazyVim
    {
        "ibhagwan/fzf-lua", -- Fzf-lua plugin for fuzzy finding
        dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency for fzf-lua
        event = "CmdlineEnter", -- Load only when entering command line
        config = function()
            require("fzf-lua").setup({
                winopts = {
                    -- Adjust appearance for fzf-lua window
                    border = "rounded", -- Rounded border for the window
                    height = 0.85, -- Set the height of the fzf window
                    width = 0.80, -- Set the width of the fzf window
                },
            })
        end,
    },

    -- Mini animate plugin for window and scroll animations
    {
        "echasnovski/mini.animate",
        version = "*",
        event = "VeryLazy", -- Load lazily to optimize performance
        config = function()
            require("configs.mini-animate") -- Load custom configuration for mini.animate
        end,
    },
}

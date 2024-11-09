return {
	-- Treesitter: Provides advanced syntax highlighting and code parsing for various languages
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" }, -- Load Treesitter when a file is opened or a new buffer is created
		config = function()
			require "configs.treesitter" -- Load Treesitter configuration
		end,
	},

	-- Mason: Manages Language Server Protocol (LSP) servers, allowing automatic installation and configuration
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy", -- Load lazily to avoid delaying startup
		dependencies = { "neovim/nvim-lspconfig" }, -- Requires nvim-lspconfig for LSP setup
		config = function()
			require "configs.lspconfig" -- Load LSP configurations
		end,
	},

	-- Mason-nvim-lint: Integrates Mason to install and manage linters through nvim-lint
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy", -- Lazy load for enhanced startup performance
		dependencies = { "mfussenegger/nvim-lint" }, -- Requires nvim-lint to execute linter tasks
		config = function()
			require "configs.lint" -- Load lint configuration
		end,
	},

	-- Mason-conform: Manages formatters with Mason integration, enhancing code formatting capabilities
	{
		"zapling/mason-conform.nvim",
		event = { "VeryLazy", "BufReadPre", "BufNewFile", "BufWritePre" }, -- Load on file read, write, or creation
		dependencies = { "stevearc/conform.nvim" }, -- Requires conform for formatting operations
		config = function()
			require "configs.conform" -- Load conform configuration
		end,
	},

	-- Tmux and Neovim pane navigation: Enables smooth navigation between Tmux and Neovim panes
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy", -- Lazy load for performance
	},

	-- Mini animate plugin: Adds animations to improve the visual transitions within the UI
	{
		"echasnovski/mini.animate",
		version = "*", -- Use latest version
		event = "VeryLazy", -- Lazy load for performance
		config = function()
			require "configs.mini-animate" -- Load mini-animate configuration
		end,
	},

	-- Trouble: Simplifies diagnostics management, consolidating errors and warnings into a single interface
	{
		"folke/trouble.nvim",
		cmd = "Trouble", -- Load only when the Trouble command is executed
		opts = {},
	},

	-- Obsidian: Integration for note-taking with Obsidian, optimized for markdown file management
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- Always use the latest stable version
		event = "VeryLazy", -- Load lazily to optimize resources
		ft = "markdown", -- Load only for markdown file types
		dependencies = {
			"nvim-lua/plenary.nvim", -- Essential Lua utilities for plugin functionality
		},
		opts = require "configs.obsidian", -- Load options from Obsidian config
	},

	-- Markdown plugin: Provides rendering for markdown with icon support and syntax highlighting
	{
		"MeanderingProgrammer/markdown.nvim",
		event = "VeryLazy", -- Lazy load for resource optimization
		main = "render-markdown", -- Main module for rendering markdown
		name = "render-markdown", -- Name identifier for plugin configuration
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- Syntax highlighting dependency
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require "configs.markdown" -- Load markdown configuration
		end,
	},

	-- Todo-Comments: Highlights and allows searching for TODO comments in code
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy", -- Load lazily to avoid impacting startup
		dependencies = {
			"nvim-lua/plenary.nvim", -- Lua utilities for functionality
			"nvim-telescope/telescope.nvim", -- Telescope integration for searching TODO comments
		},
		config = function()
			require "configs.todo" -- Load todo-comments configuration
		end,
	},
}

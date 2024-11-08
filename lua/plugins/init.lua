return {
	-- Treesitter for syntax highlighting and code parsing
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" }, -- Load on file open or new buffer creation
		config = function()
			require "configs.treesitter"
		end,
	},

	-- Mason for managing LSP servers
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy", -- Load lazily to optimize startup
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require "configs.lspconfig"
		end,
	},

	-- Mason integration for nvim-lint
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy", -- Lazy load for better performance
		dependencies = { "mfussenegger/nvim-lint" },
		config = function()
			require "configs.lint"
		end,
	},

	-- Conform plugin for code formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		dependencies = { "zapling/mason-conform.nvim" },
		config = function()
			require "configs.conform"
		end,
	},

	-- Tmux and Neovim pane navigation
	{
		"christoomey/vim-tmux-navigator",
		lazy = false, -- Load immediately for smooth navigation
		config = function()
			-- No additional setup required
		end,
	},

	-- Mini icons plugin
	{
		"echasnovski/mini.icons",
		event = "VeryLazy",
		version = false, -- Always use the latest version
	},

	-- Mini animate plugin for smooth UI animations
	{
		"echasnovski/mini.animate",
		version = "*",
		event = "VeryLazy", -- Lazy load for performance
		config = function()
			require "configs.mini-animate"
		end,
	},

	-- Trouble plugin for managing diagnostics and quickfix lists
	{
		"folke/trouble.nvim",
		opts = {}, -- Use default options
		cmd = "Trouble", -- Load on Trouble command
	},
}

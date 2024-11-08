-- Treesitter configuration for languages and features

local options = {
	-- List of languages for Treesitter parser installation
	ensure_installed = {
		"bash",
		"lua",
		"luadoc",
		"markdown",
		"printf",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
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
		use_languagetree = true, -- Improves nested language parsing
	},

	-- Indentation settings based on code structure
	indent = {
		enable = true,
	},
}

-- Apply Treesitter configuration
require("nvim-treesitter.configs").setup(options)

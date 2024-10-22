-- Define Treesitter options for supported languages and features
local options = {
	-- List of languages for which Treesitter parsers should be installed
	-- These parsers help provide advanced syntax highlighting, indentation, and other code-related features.
	ensure_installed = {
		"bash", -- Shell scripting language used in various Unix environments
		"lua", -- Lua programming language, also used for Neovim configurations
		"luadoc", -- Lua documentation format for generating documentation from Lua code
		"markdown", -- Lightweight markup language for formatted text
		"printf", -- Formatter for printf-style format strings
		"toml", -- Configuration file format (TOML) used in many projects
		"vim", -- Vimscript language, used for Vim/Neovim configurations
		"vimdoc", -- Documentation format used for Vim help files
		"yaml", -- Data serialization language, often used in configuration files
		"html", -- Markup language for creating web pages
		"css", -- Stylesheet language used for describing the presentation of a document written in HTML or XML
		"dockerfile", -- Docker container definition language
		"gpg", -- GNU Privacy Guard configuration files
		"htmldjango", -- Django templating language (HTML + Django tags)
		"http", -- HTTP request and response language
		"javascript", -- Popular language for web development
		"jsdoc", -- Documentation format used for JavaScript code
		"json", -- Lightweight data interchange format (JavaScript Object Notation)
		"make", -- Makefile language for defining build automation rules
		"nginx", -- Configuration file language for the Nginx web server
		"php", -- PHP programming language used for web development
		"phpdoc", -- PHP documentation format for generating API documentation
		"powershell", -- Command-line shell and scripting language for Windows
		"python", -- High-level programming language often used for scripting and web development
		"regex", -- Regular expression parsing for pattern matching in text
		"scss", -- CSS preprocessor language for more dynamic stylesheets
		"sql", -- Structured Query Language, used for interacting with databases
		"ssh_config", -- Configuration file format for SSH client settings
		"tmux", -- Configuration files for Tmux terminal multiplexer
		"typescript", -- Superset of JavaScript with optional static typing
		"xml", -- Markup language used for structured data representation
		"ini", -- Simple configuration file format
	},

	-- Syntax highlighting configuration
	highlight = {
		enable = true, -- Enable syntax highlighting powered by Treesitter for better accuracy
		use_languagetree = true, -- Use the Treesitter language tree for more precise parsing of nested languages
	},

	-- Indentation configuration
	indent = {
		enable = true, -- Enable smart indentation based on Treesitter's understanding of the code structure
	},
}

-- Apply the Treesitter configuration using the defined options
require("nvim-treesitter.configs").setup(options)

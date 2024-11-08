-- Set up linting for specific file types
local lint = require "lint"

-- Define linters by file type
lint.linters_by_ft = {
	lua = { "luacheck" },
	sh = { "shellcheck" },
	php = { "phpcs" },
	javascript = { "quick-lint-js" },
	typescript = { "quick-lint-js" },
	python = { "flake8" },
	yaml = { "yamllint" },
	dockerfile = { "hadolint" },
	json = { "jsonlint" },
	html = { "htmlhint" },
}

-- Customize arguments for Luacheck
lint.linters.luacheck.args = {
	"--globals",
	"love",
	"vim", -- Add global variables
	"--formatter",
	"plain", -- Set output format
	"--codes", -- Show error/warning codes
	"--ranges", -- Display code ranges
	"-", -- Read from stdin
}

-- Ignore list for linters
local ignore_install = {}

-- Check if a table contains a value
local function table_contains(table, value)
	for _, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

-- Compile a list of linters to install
local all_linters = {}
for _, v in pairs(lint.linters_by_ft) do
	for _, linter in ipairs(v) do
		if not table_contains(ignore_install, linter) then
			table.insert(all_linters, linter)
		end
	end
end

-- Set up Mason to manage linters
require("mason-nvim-lint").setup {
	ensure_installed = all_linters,
	automatic_installation = false,
}

-- Trigger linting on specific events
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

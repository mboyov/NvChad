-- Conform.lua - Configuration for formatters with custom Prettier options and auto-save

-- Function to apply the same formatter to multiple file types
local function apply_formatter(formatter, file_types)
	local formatters = {}
	for _, file_type in ipairs(file_types) do
		formatters[file_type] = { formatter }
	end
	return formatters
end

-- Set up configuration with custom formatters and Prettier options
local options = {
	formatters_by_ft = vim.tbl_extend("force", {
		lua = { "stylua" }, -- Stylua for Lua
		python = { "black" }, -- Black for Python
		php = { "php-cs-fixer" }, -- PHP-CS-Fixer for PHP
		sh = { "shfmt" }, -- shfmt for Shell
		sql = { "sqlfmt" }, -- sqlfmt for SQL
	}, apply_formatter("prettier", { "javascript", "typescript", "html", "css", "yaml", "json" })), -- Prettier for multiple file types

	formatters = {
		prettier = {
			args = {
				"--tab-width",
				"4", -- Set tab width to 4
				"--use-tabs", -- Use tabs instead of spaces
				"--single-quote", -- Use single quotes
				"--trailing-comma",
				"es5", -- Trailing commas in ES5 style
				"--stdin-filepath",
				vim.api.nvim_buf_get_name(0), -- Ensure Prettier knows the file being processed
			},
			stdin = true, -- Prettier reads from stdin
		},
	},
	format_on_save = {
		enabled = true, -- Enable format on save
		timeout_ms = 1000, -- Timeout for larger files
		lsp_fallback = true, -- Use LSP if no specific formatter is available
	},
}

-- Autocommand to trigger format on save for all configured file types
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.ts", "*.html", "*.css", "*.yaml", "*.json", "*.lua", "*.py", "*.php", "*.sh", "*.sql" }, -- File types to format
	callback = function()
		require("conform").format({ async = false }) -- Format synchronously before saving
	end,
})

-- Return the configuration table to be used by other modules or configurations
return options

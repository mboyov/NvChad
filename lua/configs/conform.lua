-- Configuration for Conform and Mason-Conform formatters

local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		php = { "php-cs-fixer" },
		sh = { "shfmt" },
		sql = { "sqlfmt" },
	},

	formatters = {
		prettier = {
			args = { "--use-tabs", "--tab-width", "2", "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
			stdin = true,
		},
	},

	format_on_save = {
		enabled = true,
		timeout_ms = 1000,
		lsp_fallback = true,
	},
}

-- Assign Prettier to multiple file types
for _, ft in ipairs { "javascript", "typescript", "html", "css", "yaml", "json", "dockerfile" } do
	options.formatters_by_ft[ft] = { "prettier" }
end

-- Apply options to Conform and Mason-Conform
require("conform").setup(options)
require("mason-conform").setup {
	ignore_install = {},
}

return options

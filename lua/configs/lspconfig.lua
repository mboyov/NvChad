-- Load default LSP configurations
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- List of all configured LSP servers
local servers = {
	"bashls",
	"dockerls",
	"intelephense",
	"pyright",
	"sqlls",
	"yamlls",
	"emmet_ls",
	"html",
	"cssls",
	"lua_ls",
	"ts_ls",
}

-- Default LSP servers with common settings
local default_servers = { "bashls", "dockerls", "intelephense", "pyright", "sqlls", "yamlls", "ts_ls", "cssls" }

-- Set up each default LSP server with shared configuration
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup {
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	}
end

-- Configure Lua language server (lua_ls) with custom workspace settings
lspconfig.lua_ls.setup {
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
	settings = {
		Lua = {
			diagnostics = { enable = false },
			workspace = {
				library = {
					vim.fn.expand "$VIMRUNTIME/lua",
					vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
					vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/love2d/library", -- Include 3rd-party libraries
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}

-- Configure Emmet language server with custom file types and options
lspconfig.emmet_ls.setup {
	capabilities = nvlsp.capabilities,
	filetypes = { "html", "css" },
	init_options = {
		html = { options = { ["bem.enabled"] = true } },
	},
}

-- Example setup for a single server (typescript)
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- List of LSP servers to exclude from installation
local ignore_install = {}

-- Helper function to check if a table contains a value
local function table_contains(table, value)
	for _, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

-- Build a list of LSP servers to install, excluding ignored ones
local all_servers = {}
for _, s in ipairs(servers) do
	if not table_contains(ignore_install, s) then
		table.insert(all_servers, s)
	end
end

-- Configure Mason to manage LSP server installations
require("mason-lspconfig").setup {
	ensure_installed = all_servers,
	automatic_installation = false,
}

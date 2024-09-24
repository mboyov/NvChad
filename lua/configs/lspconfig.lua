-- Load default configurations for LSP servers like lua_ls
-- Uncomment the line below if you want to load default LSP settings globally.
-- require("nvchad.configs.lspconfig").defaults()

-- Import core LSP configurations (on_attach, on_init, and capabilities)
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Load lspconfig for managing LSP servers
local lspconfig = require("lspconfig")

-- Define a list of all configured LSP servers.
-- This example configures the lua_ls (Lua Language Server).
lspconfig.servers = {
    "lua_ls",
    "pyright",
    "dockerls",
    "yamlls",
    "ts_ls",
    "eslint",
    "sqlls",
    "intelephense",
}

-- Define a list of LSP servers that will use the default configuration.
local default_servers = { "pyright", "dockerls", "yamlls", "ts_ls", "eslint", "sqlls", "intelephense" }

-- Loop through the list of servers with default configuration and apply them
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- Setup lua_ls with custom settings for Lua development.
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    -- Custom settings for the Lua Language Server.
    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls.
                -- Optionally, you can declare global variables here.
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    -- Add Neovim runtime files and other specific libraries for workspace awareness.
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library", -- Add custom 3rd party libraries, such as Love2D.
                },
                maxPreload = 100000, -- Set the maximum number of files to preload.
                preloadFileSize = 10000, -- Preload only files smaller than this size (in KB).
            },
        },
    },
})

-- -- EXAMPLE CONFIGURATION
-- The example below shows how to configure multiple LSP servers, such as HTML and CSS.
-- local servers = { "html", "cssls" }
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- Apply the default setup to each LSP in the list.
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- Example of configuring a single LSP server, in this case, TypeScript (ts_ls).
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Load default configurations for LSP servers like lua_ls
-- Uncomment the line below if you want to load default LSP settings globally.
-- require("nvchad.configs.lspconfig").defaults()

-- Import core LSP configurations (on_attach, on_init, and capabilities)
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Load lspconfig for managing LSP servers
local lspconfig = require("lspconfig")

-- List of all LSP servers configured for your environment
lspconfig.servers = {
    "lua_ls", -- Lua language server
    "pyright", -- Python language server
    "dockerls", -- Docker language server
    "yamlls", -- YAML language server
    "ts_ls", -- TypeScript language server
    "sqlls", -- SQL language server
    "intelephense", -- PHP language server
    "emmet_ls", --
    "html", --
    "cssls", --
    "bashls", --
}
-- Default LSP server configurations
local default_servers = { "pyright", "dockerls", "yamlls", "ts_ls", "sqlls", "intelephense", "html", "cssls", "bashls" }

-- Loop through the list and apply default configurations
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- Lua language server with custom settings
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    -- Custom settings for the Lua Language Server
    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable diagnostics from lua_ls
                -- You can declare global variables here if needed
            },
            workspace = {
                library = {
                    -- Add Neovim runtime files and other specific libraries
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library", -- Add 3rd party libraries like Love2D
                },
                maxPreload = 100000, -- Maximum files to preload
                preloadFileSize = 10000, -- Preload files smaller than this size (in KB)
            },
        },
    },
})

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "pug",
        "typescriptreact",
        "vue",
        "php",
    },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    },
})

-- Set the path for the base46 cache, which stores theme-related data
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

-- Set the leader key to spacebar (used as a prefix for custom key mappings)
vim.g.mapleader = " "

-- Enable relative line numbers in the current window
vim.wo.relativenumber = true -- Shows relative line numbers for easier navigation

-- -------------------------------
-- Bootstrap lazy.nvim and plugins
-- -------------------------------

-- Define the path to where lazy.nvim is or should be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed; if not, clone it from the repository
if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git" -- Repository URL for lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }) -- Clone the stable branch
end

-- Prepend lazy.nvim's installation path to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Load the lazy.nvim configuration
local lazy_config = require("configs.lazy")

-- ---------------------
-- Load plugins via lazy.nvim
-- ---------------------
require("lazy").setup({
    {
        "NvChad/NvChad", -- The main NvChad repository
        lazy = false, -- Load NvChad immediately (not lazily)
        branch = "v2.5", -- Use the stable "v2.5" branch
        import = "nvchad.plugins", -- Import default NvChad plugins
    },

    { import = "plugins" }, -- Import custom plugin configurations
}, lazy_config)

-- -----------------
-- Load theme and statusline
-- -----------------

-- Load the default theme settings from the cached base46 files
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline") -- Load the statusline configuration

-- ------------------
-- Load other settings
-- ------------------

require("options") -- Load custom options for Neovim
require("nvchad.autocmds") -- Load custom auto commands

-- Schedule the loading of custom mappings (delayed for better startup performance)
vim.schedule(function()
    require("mappings") -- Load custom key mappings
end)

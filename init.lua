--[[=================================================================
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   MBOYOV/NVCHAD    ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||                    ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=================================================================--]]

-- Entry point for Neovim configuration

-- Set cache path and leader key
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " " -- Define <Space> as the leader key
vim.wo.relativenumber = true -- Enable relative line numbers

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path

-- Load plugins with lazy.nvim
local lazy_config = require "configs.lazy"
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false, -- Load NvChad on startup
		branch = "v2.5",
		import = "nvchad.plugins",
	},
	{ import = "plugins" },
}, lazy_config)

-- Load theme and UI components
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load Neovim settings, autocommands, and key mappings
require "options"
require "nvchad.autocmds"
vim.schedule(function()
	require "mappings"
end)

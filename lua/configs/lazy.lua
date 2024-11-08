return {
	defaults = { lazy = true }, -- Lazy load plugins by default
	install = { colorscheme = { "nvchad" } }, -- Set "nvchad" as default colorscheme

	ui = {
		icons = { -- UI icons
			ft = "", -- File type icon
			lazy = "󰂠 ", -- Lazy-loaded icon
			loaded = "", -- Loaded icon
			not_loaded = "", -- Not loaded icon
		},
	},

	performance = {
		rtp = {
			disabled_plugins = { -- Disable built-in plugins for better performance
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
}

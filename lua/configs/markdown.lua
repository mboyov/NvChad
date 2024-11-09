require("obsidian").get_client().opts.ui.enable = false

local options = {
	require("render-markdown").setup {
		file_types = { "markdown", "vimwiki" },
		code = {
			width = "block",
			min_width = 45,
			left_pad = 2,
			right_pad = 2,
		},
	},
}

return options

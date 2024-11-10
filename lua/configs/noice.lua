require("noice").setup {
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
}
require("notify").setup {
	background_colour = "#000000", -- Transparent background to match the overall theme
}

-- Noice and Notify Configuration with Tokyo Night theme applied
local tokyo_night_colors = {
	red = "#db4b4b",
	yellow = "#e0af68",
	blue = "#7aa2f7",
	green = "#1abc9c",
	purple = "#bb9af7",
}

local function set_tn()
	-- Noice highlights (popup and command line borders)
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = tokyo_night_colors.blue }) -- Command line popup border
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = tokyo_night_colors.purple }) -- Command line popup title
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBody", { fg = tokyo_night_colors.blue }) -- Command line popup text
	vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = tokyo_night_colors.blue }) -- Generic popup border
	vim.api.nvim_set_hl(0, "NoicePopupTitle", { fg = tokyo_night_colors.purple }) -- Generic popup title

	-- Notify highlights (borders, titles, and text)
	vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = tokyo_night_colors.red }) -- Error border color
	vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = tokyo_night_colors.yellow }) -- Warning border color
	vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = tokyo_night_colors.blue }) -- Info border color
	vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = tokyo_night_colors.green }) -- Debug border color
	vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = tokyo_night_colors.purple }) -- Trace border color

	vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = tokyo_night_colors.red }) -- Error title color
	vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = tokyo_night_colors.yellow }) -- Warning title color
	vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = tokyo_night_colors.blue }) -- Info title color
	vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = tokyo_night_colors.green }) -- Debug title color
	vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = tokyo_night_colors.purple }) -- Trace title color

	vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = tokyo_night_colors.red }) -- Error text color
	vim.api.nvim_set_hl(0, "NotifyWARNBody", { fg = tokyo_night_colors.yellow }) -- Warning text color
	vim.api.nvim_set_hl(0, "NotifyINFOBody", { fg = tokyo_night_colors.blue }) -- Info text color
	vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = tokyo_night_colors.green }) -- Debug text color
	vim.api.nvim_set_hl(0, "NotifyTRACEBody", { fg = tokyo_night_colors.purple }) -- Trace text color
end

set_tn()

-- Noice and Notify Configuration with Tokyo Night theme applied
local tokyo_night_colors = {
	red = "#db4b4b",
	yellow = "#e0af68",
	blue = "#7aa2f7",
	green = "#1abc9c",
	purple = "#bb9af7",
}

-- Noice Configuration
require("noice").setup({
	lsp = {
		-- Override markdown rendering so that cmp and other plugins use Treesitter
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- Convert LSP output to markdown lines
			["vim.lsp.util.stylize_markdown"] = true, -- Apply markdown styles using Treesitter
			["cmp.entry.get_documentation"] = true, -- Integrate cmp documentation, requires hrsh7th/nvim-cmp
		},
		signature = {
			enabled = false, -- Disable signature help to avoid conflict with another plugin
		},
	},
	-- Enable presets for easier configuration
	presets = {
		bottom_search = true, -- Use a classic bottom command line for search
		command_palette = true, -- Display the command line and popup menu together
		long_message_to_split = true, -- Long messages will be sent to a split window
		inc_rename = false, -- Disable input dialog for inc-rename.nvim
		lsp_doc_border = true, -- Add a border to hover docs and signature help
	},
	routes = {
		{
			filter = {
				event = "notify", -- Filter notification events
				find = "No information available", -- Skip this specific notification
			},
			opts = { skip = true }, -- Skip notifications with this message
		},
	},
	integrations = {
		fzf = { -- Integration with fzf-lua
			enabled = true, -- Enable fzf-lua for fuzzy searching in Noice
		},
	},
})

-- Configuration for nvim-notify with Tokyo Night theme adjustments
require("notify").setup({
	background_colour = "#000000", -- Transparent background to match the overall theme
	stages = "fade_in_slide_out", -- Notification appearance and disappearance effect
	timeout = 10000, -- Duration before notification disappears
	render = "default", -- Use default rendering
	icons = {
		ERROR = "", -- Icon for errors
		WARN = "", -- Icon for warnings
		INFO = "", -- Icon for informational messages
		DEBUG = "", -- Icon for debug messages
		TRACE = "✎", -- Icon for trace messages
	},
})

-- Set highlight groups for notify and noice popups using Tokyo Night colors
local function set_tokyo_night_highlights()
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

	-- Noice highlights (popup and command line borders)
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = tokyo_night_colors.blue }) -- Command line popup border
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = tokyo_night_colors.purple }) -- Command line popup title
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBody", { fg = tokyo_night_colors.blue }) -- Command line popup text
	vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = tokyo_night_colors.blue }) -- Generic popup border
	vim.api.nvim_set_hl(0, "NoicePopupTitle", { fg = tokyo_night_colors.purple }) -- Generic popup title
end

-- Apply the highlight settings for Tokyo Night
set_tokyo_night_highlights()

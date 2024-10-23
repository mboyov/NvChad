-- Import NvChad default mappings
require("nvchad.mappings")

-- Utility for mapping keys with options
local map = vim.keymap.set
local opts = { noremap = true, silent = true } -- Default options for all mappings

-- Default mode for mappings (normal mode by default)
local default_mode = "n"

-- Define all mappings
local mappings = {
	-- Custom Key Mappings (default mode is normal mode "n")
	{ key = ";", cmd = ":", desc = "Enter command mode" },
	{ mode = "i", key = "jk", cmd = "<ESC>", desc = "Quick exit from insert mode" },
	{ mode = { "n", "i", "v" }, key = "<C-s>", cmd = "<cmd>w<CR>", desc = "Save the current file" },
	{ key = "te", cmd = ":tabedit<Return>", desc = "Open a new tab" },
	{ key = "ss", cmd = ":split<Return>", desc = "Split the window horizontally" },
	{ key = "sv", cmd = ":vsplit<Return>", desc = "Split the window vertically" },

	-- Tmux Navigation Mappings (default to normal mode "n")
	{ key = "<C-h>", cmd = "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to the pane on the left" },
	{ key = "<C-j>", cmd = "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to the pane below" },
	{ key = "<C-k>", cmd = "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to the pane above" },
	{ key = "<C-l>", cmd = "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to the pane on the right" },

	-- Terminal Mode Navigation Mappings (applied dynamically)
	{ mode = "t", key = "<C-h>", cmd = [[<C-\><C-N><C-w>h]], desc = "Navigate to the pane on the left" },
	{ mode = "t", key = "<C-j>", cmd = [[<C-\><C-N><C-w>j]], desc = "Navigate to the pane below" },
	{ mode = "t", key = "<C-k>", cmd = [[<C-\><C-N><C-w>k]], desc = "Navigate to the pane above" },
	{ mode = "t", key = "<C-l>", cmd = [[<C-\><C-N><C-w>l]], desc = "Navigate to the pane on the right" },

	-- Trouble.nvim Mappings
	{ key = "<leader>tx", cmd = "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
	{
		key = "<leader>tX",
		cmd = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{ key = "<leader>ts", cmd = "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
	{
		key = "<leader>tl",
		cmd = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{ key = "<leader>tL", cmd = "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
	{ key = "<leader>tQ", cmd = "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
}

-- Function to apply terminal key mappings dynamically
function _G.set_terminal_keymaps()
	for _, mapping in ipairs(mappings) do
		if mapping.mode == "t" then
			vim.api.nvim_buf_set_keymap(0, mapping.mode, mapping.key, mapping.cmd, opts)
		end
	end
end

-- Automatically apply terminal mappings when opening a terminal
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Apply all other mappings immediately
for _, mapping in ipairs(mappings) do
	local mode = mapping.mode or default_mode -- Use default mode if not specified
	local description = mapping.desc or "" -- Description is optional
	map(mode, mapping.key, mapping.cmd, vim.tbl_extend("force", opts, { desc = description }))
end

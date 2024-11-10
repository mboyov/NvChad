require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local default_mode = "n"
local diagnostics_active = true -- Local variable to toggle diagnostics

local mappings = {
	-- General Key Mappings
	{ mode = { "n", "i", "v" }, key = "<C-s>", cmd = "<cmd>w<CR>", desc = "Save the current file" },
	{ key = ";", cmd = ":", desc = "Enter command mode" },
	{ mode = "i", key = "jk", cmd = "<ESC>", desc = "Quick exit from insert mode" },

	-- Tmux Navigation
	{ key = "<C-h>", cmd = "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to the left pane" },
	{ key = "<C-j>", cmd = "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to the below pane" },
	{ key = "<C-k>", cmd = "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to the above pane" },
	{ key = "<C-l>", cmd = "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to the right pane" },

	-- Terminal Mode Navigation Mappings (applied dynamically)
	{ mode = "t", key = "<C-h>", cmd = [[<C-\><C-N><C-w>h]], desc = "Navigate to the pane on the left" },
	{ mode = "t", key = "<C-j>", cmd = [[<C-\><C-N><C-w>j]], desc = "Navigate to the pane below" },
	{ mode = "t", key = "<C-k>", cmd = [[<C-\><C-N><C-w>k]], desc = "Navigate to the pane above" },
	{ mode = "t", key = "<C-l>", cmd = [[<C-\><C-N><C-w>l]], desc = "Navigate to the pane on the right" },

	-- Scrolling with centered screen position
	{ key = "<C-t>", cmd = "<C-d>zz", desc = "Scroll down and center" },
	{ key = "<C-b>", cmd = "<C-u>zz", desc = "Scroll up and center" },
	{ key = "n", cmd = "nzzzv", desc = "Next search result, centered" },
	{ key = "N", cmd = "Nzzzv", desc = "Previous search result, centered" },

	-- Resize windows with arrow keys
	{ key = "<Up>", cmd = ":resize -2<CR>", desc = "Decrease window height" },
	{ key = "<Down>", cmd = ":resize +2<CR>", desc = "Increase window height" },
	{ key = "<Left>", cmd = ":vertical resize -2<CR>", desc = "Decrease window width" },
	{ key = "<Right>", cmd = ":vertical resize +2<CR>", desc = "Increase window width" },

	-- Split window management
	{ key = "sv", cmd = "<C-w>v", desc = "Split window vertically" },
	{ key = "ss", cmd = "<C-w>s", desc = "Split window horizontally" },
	{ key = "<leader>se", cmd = "<C-w>=", desc = "Equalize window sizes" },
	{ key = "<leader>xs", cmd = ":close<CR>", desc = "Close current split window" },

	-- Tab management
	{ key = "<leader>gt", cmd = ":tabnew<CR>", desc = "Open a new tab" },
	{ key = "<leader>gx", cmd = ":tabclose<CR>", desc = "Close the current tab" },
	{ key = "<leader>gn", cmd = ":tabn<CR>", desc = "Go to the next tab" },
	{ key = "<leader>gp", cmd = ":tabp<CR>", desc = "Go to the previous tab" },

	-- Todo Comment
	{ key = "<leader>ft", cmd = ":TodoTelescope<CR>", desc = "TodoTelescope" },

	-- Diagnostics keymaps

	{ key = "<leader>dn", cmd = vim.diagnostic.goto_prev, desc = "Jump to the previous Diagnostics" },
	{ key = "<leader>dp", cmd = vim.diagnostic.goto_next, desc = "Jump to the next Diagnostics" },

	-- Toggle diagnostics
	{
		key = "<leader>do",
		cmd = function()
			diagnostics_active = not diagnostics_active
			if diagnostics_active then
				vim.diagnostic.enable(0)
			else
				vim.diagnostic.disable(0)
			end
		end,
		desc = "Toggle diagnostics display",
	},

	-- Trouble.nvim Mappings
	{ key = "<leader>tx", cmd = "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble diagnostics" },
	{ key = "<leader>tX", cmd = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Toggle buffer diagnostics" },
	{ key = "<leader>ts", cmd = "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Toggle Trouble symbols" },
	{
		key = "<leader>tl",
		cmd = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "Toggle LSP definitions",
	},
	{ key = "<leader>tL", cmd = "<cmd>Trouble loclist toggle<cr>", desc = "Toggle location list" },
	{ key = "<leader>tQ", cmd = "<cmd>Trouble qflist toggle<cr>", desc = "Toggle quickfix list" },
}

-- Sets terminal-specific mappings when opening a terminal
function _G.set_terminal_keymaps()
	for _, mapping in ipairs(mappings) do
		if mapping.mode == "t" then
			vim.api.nvim_buf_set_keymap(0, mapping.mode, mapping.key, mapping.cmd, opts)
		end
	end
end

-- Apply terminal mappings automatically
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Apply all other mappings
for _, mapping in ipairs(mappings) do
	local mode = mapping.mode or default_mode
	local description = mapping.desc or ""
	map(mode, mapping.key, mapping.cmd, vim.tbl_extend("force", opts, { desc = description }))
end

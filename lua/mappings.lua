-- Import NvChad default mappings
require("nvchad.mappings")

-- Utility for mapping keys
local map = vim.keymap.set
local opts = { noremap = true, silent = true } -- Default options for all mappings

-- ----------------------
-- Custom Key Mappings
-- ----------------------

-- Enter command mode with ;
map("n", ";", ":", { desc = "Enter command mode" })

-- Insert mode escape shortcut (quick exit)
map("i", "jk", "<ESC>", { desc = "Quick exit insert mode" })

-- Save file in normal, insert, and visual modes with Ctrl + s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- ----------------------
-- Tmux Navigation Mappings
-- ----------------------

-- Map Tmux-like navigation to Control + hjkl without prefix
local tmux_maps = {
    { key = "<C-h>", cmd = "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left" },
    { key = "<C-j>", cmd = "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down" },
    { key = "<C-k>", cmd = "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up" },
    { key = "<C-l>", cmd = "<cmd>TmuxNavigateRight<CR>", desc = "Navigate right" },
}

-- Apply Tmux navigation mappings for normal mode
for _, mapping in ipairs(tmux_maps) do
    map("n", mapping.key, mapping.cmd, vim.tbl_extend("force", opts, { desc = mapping.desc }))
end

-- ----------------------
-- Terminal Mode Navigation Mappings (Tmux style)
-- ----------------------

-- Function to set terminal keymaps for navigation
function _G.set_terminal_keymaps()
    local term_opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
end

-- Automatically set these keymaps when opening a terminal
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Import NvChad default mappings
require("nvchad.mappings")

-- Utility for mapping keys with options
local map = vim.keymap.set
local opts = { noremap = true, silent = true } -- Default options for all mappings

-- Default mode for mappings
local default_mode = "n"

-- Define all mappings
local mappings = {
    -- Custom Key Mappings
    { key = ";", cmd = ":", desc = "Enter command mode" }, -- Default mode is "n"
    { mode = "i", key = "jk", cmd = "<ESC>", desc = "Quick exit insert mode" },
    { mode = { "n", "i", "v" }, key = "<C-s>", cmd = "<cmd>w<CR>", desc = "Save file" },

    -- Tmux Navigation Mappings (default to normal mode)
    { key = "<C-h>", cmd = "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left" },
    { key = "<C-j>", cmd = "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down" },
    { key = "<C-k>", cmd = "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up" },
    { key = "<C-l>", cmd = "<cmd>TmuxNavigateRight<CR>", desc = "Navigate right" },

    -- Trouble.nvim Mappings
    { key = "<leader>tx", cmd = "Trouble diagnostics toggle", desc = "Diagnostics Trouble" },
    { key = "<leader>tX", cmd = "Trouble diagnostics toggle filter.buf=0", desc = "Diagnostics Trouble Buffer" },
    { key = "<leader>ts", cmd = "Trouble symbols toggle focus=false", desc = "Trouble symbols" },
    {
        key = "<leader>tl",
        cmd = "Trouble lsp toggle focus=false win.position=right",
        desc = "Trouble LSP Definitions / references / ...",
    },
    { key = "<leader>tL", cmd = "Trouble loclist toggle", desc = "Trouble Location List" },
    { key = "<leader>tQ", cmd = "Trouble qflist toggle", desc = "Trouble Quickfix List" },

    -- Terminal Mode Navigation Mappings (applied dynamically)
    { mode = "t", key = "<C-h>", cmd = [[<C-\><C-N><C-w>h]] },
    { mode = "t", key = "<C-j>", cmd = [[<C-\><C-N><C-w>j]] },
    { mode = "t", key = "<C-k>", cmd = [[<C-\><C-N><C-w>k]] },
    { mode = "t", key = "<C-l>", cmd = [[<C-\><C-N><C-w>l]] },
    { mode = "t", key = "<C-t>", cmd = [[<C-\><C-N>]] }, -- Quick exit to normal mode in terminal
}

-- Function to apply terminal key mappings dynamically
function _G.set_terminal_keymaps()
    local term_opts = { noremap = true, silent = true }
    for _, mapping in ipairs(mappings) do
        if mapping.mode == "t" then
            vim.api.nvim_buf_set_keymap(0, mapping.mode, mapping.key, mapping.cmd, term_opts)
        end
    end
end

-- Automatically apply terminal mappings when opening a terminal
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Apply other mappings immediately
for _, mapping in ipairs(mappings) do
    local mode = mapping.mode or default_mode -- Use default mode if not specified
    local description = mapping.desc or "" -- Description is optional

    if mode ~= "t" then
        -- Apply non-terminal mappings immediately
        map(mode, mapping.key, mapping.cmd, vim.tbl_extend("force", opts, { desc = description }))
    end
end

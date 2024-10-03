local copilot = require("copilot")

copilot.setup({
    suggestion = { enabled = true },
    panel = { enabled = true },
    -- Other configuration options...
})

-- Disable default key mappings
vim.g.copilot_no_tab_map = true

-- Accept suggestions with <C-L> instead of <Tab>
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Navigate between suggestions with Alt + ] and Alt + [
vim.api.nvim_set_keymap("i", "<M-6>", "copilot#Next()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<M-5>", "copilot#Previous()", { silent = true, expr = true })

-- Open the suggestion panel with <C-P>
vim.api.nvim_set_keymap("n", "<C-P>", ":Copilot panel<CR>", { silent = true, noremap = true })

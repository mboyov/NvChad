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
})

-- Configuration for nvim-notify to prevent error messages
require("notify").setup({
    background_colour = "#00000", -- Set a solid background color to prevent transparency issues
})

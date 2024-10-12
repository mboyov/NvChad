local trouble = require("trouble")

-- Configure Trouble.nvim with mode-specific auto_open
trouble.setup({
    mode = "document_diagnostics", -- Display diagnostics for the current document
    auto_close = true, -- Automatically close Trouble if there are no diagnostics
    use_diagnostic_signs = true, -- Use diagnostic signs in the gutter
    modes = {
        diagnostics = { auto_open = false }, -- Automatically open Trouble for diagnostics mode
    },
})

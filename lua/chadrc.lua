-- This file must follow the same structure as the nvconfig.lua file used by NvChad
-- You can reference it here: https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please review that file to understand all the available options for customizing NvChad.

---@type ChadrcConfig -- Defining the table type as ChadrcConfig for autocompletion and validation in Lua
local M = {}

-- Base46 configuration, which controls theme and highlights in NvChad
M.base46 = {
    theme = "catppuccin", -- Sets the color scheme to "catppuccin" (a popular, aesthetically pleasing theme)
    transparency = true, -- Enables transparent background in the Neovim UI

    -- Highlight override options:
    -- hl_override allows you to manually override the default highlight settings
    -- Uncomment and customize the following lines to apply different styles to comments
    -- hl_override = {
    --     Comment = { italic = true }, -- Makes comments italicized
    --     ["@comment"] = { italic = true }, -- Applies the same for Treesitter comments
    -- },
}

return M -- Return the configuration table so that NvChad can apply it

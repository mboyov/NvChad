-- Configuration structure should match nvconfig.lua from NvChad
-- Reference: https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Read nvconfig.lua for all available options

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tokyonight", -- Set the theme for Neovim UI
	-- Uncomment for transparency in the Neovim UI
	transparency = true,

	-- Uncomment to apply style overrides
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M

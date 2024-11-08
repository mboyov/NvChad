-- Configures mini.animate plugin for window, scroll, and cursor animations

local animate = require "mini.animate"

animate.setup {
	resize = {
		enable = true, -- Enable animated window resizing
		timing = animate.gen_timing.linear { duration = 10 }, -- Set resize speed
	},
	scroll = {
		enable = true, -- Enable animated scrolling
		timing = animate.gen_timing.linear { duration = 10 }, -- Set scroll speed
	},
	cursor = {
		enable = true, -- Enable animated cursor movements
		timing = animate.gen_timing.linear { duration = 5 }, -- Set cursor movement speed
	},
	open = { enable = false }, -- Disable animation on window open
	close = { enable = false }, -- Disable animation on window close
}

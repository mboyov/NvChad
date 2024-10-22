-- configs/mini-animate.lua

local animate = require("mini.animate")

-- Set up mini.animate with custom configuration
animate.setup({
	resize = {
		enable = true, -- Enable window resizing animations
		timing = animate.gen_timing.linear({ duration = 5 }), -- Reduce duration for faster resizing
	},
	scroll = {
		enable = true, -- Enable scroll animations
		timing = animate.gen_timing.linear({ duration = 20 }), -- Reduce duration for smoother scrolling
	},
	cursor = {
		enable = true, -- Enable cursor animations (for moving between words)
		timing = animate.gen_timing.linear({ duration = 5 }), -- Customize the duration for cursor movements
	},
	open = {
		enable = true, -- Enable animations for opening new windows or splits
		timing = animate.gen_timing.linear({ duration = 100 }), -- Fast animation for opening windows
	},
})

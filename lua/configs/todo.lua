local todo = require "todo-comments"

todo.setup {
	-- Customize the setup if needed
	keywords = {
		TODO = { icon = " ", color = "info" },
		FIX = { icon = " ", color = "error" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning" },
		PERF = { icon = " ", color = "info" },
		NOTE = { icon = " ", color = "hint" },
	},
	-- Enable Telescope integration
	telescope = {
		-- Ensure it is loaded correctly
		search = "live_grep", -- Replace with 'live_grep' if 'find' does not work as expected
		-- search = "find", -- Replace with 'live_grep' if 'find' does not work as expected
	},
}

local todo = require "todo-comments"

todo.setup {
	telescope = {
		-- Ensure it is loaded correctly
		search = "live_grep", -- Replace with 'live_grep' if 'find' does not work as expected
		-- search = "find", -- Replace with 'live_grep' if 'find' does not work as expected
	},
}

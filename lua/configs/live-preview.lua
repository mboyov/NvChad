-- Load the live-preview plugin
local live_preview = require("livepreview")

-- Set up the live-preview plugin with custom configuration
live_preview.setup({
	port = 3000, -- Specify the port number for the live preview server
	browser = "default", -- Use the default system browser for the preview
	commands = {
		start = "LivePreview", -- Command to start the live preview
		stop = "StopPreview", -- Command to stop the live preview
	},
})

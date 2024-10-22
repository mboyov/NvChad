-- Load the pane-resizer plugin
local pane_resizer = require("pane_resizer")

-- Set up the pane-resizer with custom configuration
pane_resizer.setup({
    NVIMTREE_WIDTH = 30, -- Set the NvimTree window width to 30
    FOCUSED_WIDTH_PERCENTAGE = 0.65, -- Resize the focused window to 60% of the available width
})

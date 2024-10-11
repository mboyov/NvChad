-- Load default options from NvChad's core configuration
require("nvchad.options")

-- You can add or override your own custom options below this line

local o = vim.o -- `vim.o` is used to set global options in Neovim

-- Indenting settings
o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
o.tabstop = 4 -- Number of spaces that a <Tab> character represents
o.softtabstop = 4 -- Number of spaces that <Tab> counts for while editing (in insert mode)

-- Enable lazyredraw to improve performance by preventing screen redraws during macro execution,
-- which can be beneficial for large files or slow operations.
o.lazyredraw = true

-- Option to enable cursorline (shows a line highlighting the cursor position)
-- Uncomment the following line to enable cursorline both on the line number and in the line text
-- o.cursorlineopt = 'both' -- Use 'both' to highlight the cursor's row and column

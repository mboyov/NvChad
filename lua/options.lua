require "nvchad.options"

-- Custom Neovim options

local o = vim.o

o.cursorlineopt = "both" -- Highlight both the line and line number at the cursor
o.wrap = false -- Disable line wrapping; display lines as one long line

-- Indentation settings
o.shiftwidth = 2 -- Number of spaces for each indentation level
o.tabstop = 2 -- Width of a <Tab> character
o.softtabstop = 2 -- Width for <Tab> when inserting
o.expandtab = true -- Use spaces instead of actual tab characters
o.smartindent = true -- Enable smart indentation based on syntax

-- Performance setting
o.lazyredraw = false -- Disable redraw during macros for performance

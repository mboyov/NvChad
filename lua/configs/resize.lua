local api = vim.api

-- Function to resize the focused pane only, keeping the other panes unchanged
local function resize_focused_pane()
    local current_win = api.nvim_get_current_win()
    local total_width = api.nvim_get_option("columns")
    local windows = api.nvim_tabpage_list_wins(0) -- Get all windows in the current tab
    local non_floating_windows = {}
    local nvimtree_win = nil

    -- Filter out floating windows and identify NvimTree
    for _, win in ipairs(windows) do
        local bufname = api.nvim_buf_get_name(api.nvim_win_get_buf(win))
        local win_config = api.nvim_win_get_config(win)

        -- Identify NvimTree and exclude it from the resizing
        if bufname:match("NvimTree") then
            nvimtree_win = win
        elseif win_config.relative == "" then -- Non-floating windows
            table.insert(non_floating_windows, win)
        end
    end

    -- If there's only one buffer or less, skip resizing
    if #non_floating_windows < 1 or current_win == nvimtree_win then
        return
    end

    -- Disable text wrapping to avoid text being squeezed for the current window
    api.nvim_win_set_option(current_win, "wrap", false)

    -- Adjust total width if NvimTree is open (ignore its width for other windows)
    if nvimtree_win then
        local nvimtree_width = api.nvim_win_get_width(nvimtree_win)
        total_width = total_width - nvimtree_width
    end

    -- Calculate the width for the focused window (keeping the others unchanged)
    local focused_width = math.floor(total_width * 0.6)

    -- Resize the focused window to 60% of the available width
    if current_win ~= nvimtree_win then
        api.nvim_win_set_width(current_win, focused_width)
    end
end

-- Automatically resize the focused pane only, ignoring floating windows and adjusting for NvimTree
api.nvim_create_autocmd("WinEnter", {
    group = api.nvim_create_augroup("AutoResizePanes", { clear = true }),
    callback = resize_focused_pane,
})

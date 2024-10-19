local api = vim.api

-- Function to resize panes
local function resize_panes()
    local current_win = api.nvim_get_current_win()
    local current_width = api.nvim_win_get_width(current_win)
    local total_width = api.nvim_get_option("columns")

    -- Check if the current buffer is nvim-tree
    local bufname = api.nvim_buf_get_name(api.nvim_win_get_buf(current_win))
    if bufname:match("NvimTree") then
        return
    end

    -- If the width is less than 49%, resize to 80%
    if current_width < total_width * 0.49 then
        local new_width = math.floor(total_width * 0.6)
        api.nvim_win_set_width(current_win, new_width)
    end
end

-- Command to automatically resize on pane change
api.nvim_create_autocmd("WinEnter", {
    group = api.nvim_create_augroup("AutoResizePanes", { clear = true }),
    callback = resize_panes,
})

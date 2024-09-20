local options = {
    -- Key mappings configuration
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>lc", "<cmd>LazyGitConfig<cr>", desc = "LazyConfig" },
        { "<leader>lgf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGitCurrentFile" },
        { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGitFilter" },
        { "<leader>lgw", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGitFilterCurrentFile" },
    },

    -- Commands to load
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
}

-- Setup function for key mappings and other configurations
local function setup()
    for _, keymap in ipairs(options.keys) do
        vim.keymap.set("n", keymap[1], keymap[2], { desc = keymap.desc, noremap = true, silent = true })
    end
end

-- Return the setup function to be called in init.lua
return {
    setup = setup,
}

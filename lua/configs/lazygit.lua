local options = {
    -- Key mappings configuration for LazyGit-related commands
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }, -- Open LazyGit
        { "<leader>lc", "<cmd>LazyGitConfig<cr>", desc = "LazyConfig" }, -- Open LazyGit configuration
        { "<leader>lgf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGitCurrentFile" }, -- Open LazyGit for the current file
        { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGitFilter" }, -- Filter changes using LazyGit
        { "<leader>lgw", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGitFilterCurrentFile" }, -- Filter changes with LazyGit
    },

    -- Commands to be loaded for LazyGit functionality
    cmd = {
        "LazyGit", -- Main LazyGit command
        "LazyGitConfig", -- Command to open LazyGit configuration
        "LazyGitCurrentFile", -- Command to open LazyGit for the current file
        "LazyGitFilter", -- Command to filter changes with LazyGit
        "LazyGitFilterCurrentFile", -- Command to filter changes for the current file with LazyGit
    },
}

-- Setup function to register key mappings and apply other configurations
local function setup()
    for _, keymap in ipairs(options.keys) do
        -- Set the key mapping in normal mode (n) with description, no remapping, and silence enabled
        vim.keymap.set("n", keymap[1], keymap[2], { desc = keymap.desc, noremap = true, silent = true })
    end
end

-- Return the setup function to be invoked in init.lua for configuration
return {
    setup = setup,
}

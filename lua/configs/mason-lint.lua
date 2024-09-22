-- Load the 'lint' module to access linting configurations
local lint = package.loaded["lint"]

-- List of linters to ignore during the installation process
local ignore_install = {}

-- Helper function to check if a value exists within a table
local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true -- Return true if the value is found in the table
        end
    end
    return false -- Return false if the value is not found
end

-- Build a list of all linters to install, excluding those in the ignore list
local all_linters = {}
for _, v in pairs(lint.linters_by_ft) do
    for _, linter in ipairs(v) do
        -- Only add linters that are not in the ignore_install list
        if not table_contains(ignore_install, linter) then
            table.insert(all_linters, linter) -- Insert linter into the final list
        end
    end
end

-- Set up 'mason-nvim-lint' with the list of linters to ensure they are installed
require("mason-nvim-lint").setup({
    ensure_installed = all_linters, -- Install all linters that are not ignored
    automatic_installation = false, -- Disable automatic installation of linters
})

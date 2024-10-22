-- Load the 'lspconfig' module to access LSP server configurations
local lspconfig = package.loaded["lspconfig"]

-- List of LSP servers to ignore during the installation process
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

-- Build a list of all LSP servers to install, excluding those in the ignore list
local all_servers = {}
for _, s in ipairs(lspconfig.servers) do
	-- Only add servers that are not in the ignore_install list
	if not table_contains(ignore_install, s) then
		table.insert(all_servers, s) -- Insert the server into the final list
	end
end

-- Set up 'mason-lspconfig' with the list of LSP servers to ensure they are installed
require("mason-lspconfig").setup({
	ensure_installed = all_servers, -- Install all LSP servers that are not ignored
	automatic_installation = false, -- Disable automatic installation of LSP servers
})

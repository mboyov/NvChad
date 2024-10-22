-- Set up the 'mason-conform' plugin, which manages formatter installation and configuration
require("mason-conform").setup({
	-- Define a list of formatters that should be ignored during the installation process
	-- This can be useful if you do not want certain formatters to be automatically installed
	ignore_install = {}, -- No formatters are ignored by default
})

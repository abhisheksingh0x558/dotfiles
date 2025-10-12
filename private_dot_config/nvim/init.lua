-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

require("lazy").setup({
	-- Collection of plugins
	{ "folke/snacks.nvim", opts = {} },
	"echasnovski/mini.nvim",

	-- Lua libraries
	"nvim-neotest/nvim-nio", -- TODO: Use luarocks to manage this and remove from here
})

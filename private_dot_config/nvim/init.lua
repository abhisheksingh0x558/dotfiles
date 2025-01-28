-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

-- Code style
vim.g.editorconfig = true -- EditorConfig integration

require("lazy").setup({
	-- Collection of plugins
	{ "folke/snacks.nvim", opts = {} },
	"echasnovski/mini.nvim",

	-- Lua libraries
	"nvim-neotest/nvim-nio", -- TODO: Use luarocks to manage this and remove from here

	-- Lua transpiler
	{ "rktjmp/hotpot.nvim", opts = {} },
})

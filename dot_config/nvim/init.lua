-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

-- Code style
vim.g.editorconfig = true -- EditorConfig integration

-- Keymaps
vim.g.mapleader = " " -- Leader key
vim.g.maplocalleader = "\\" -- Local leader key

require("lazy").setup({
	-- Collection of plugins
	{
		"folke/snacks.nvim",
		opts = {},
	},
	"echasnovski/mini.nvim",

	-- Lua transpiler
	{
		"rktjmp/hotpot.nvim",
		opts = {},
	},

	-- Keymaps
	{ "numToStr/Comment.nvim", opts = {} }, -- Manipulate comments TODO: Remove this
	{ "kylechui/nvim-surround", opts = {} }, -- Manipulate surrounding pairs TODO: Remove this
	{ "gbprod/substitute.nvim", opts = {} }, -- Exchange text TODO: Remove this
	{ "johmsalas/text-case.nvim", opts = {} }, -- Manipulate text cases TODO: Remove this
	{ "folke/flash.nvim", opts = {} }, -- Navigate with search labels
	"Vonr/align.nvim", -- Manipulate alignments TODO: Remove this
	-- Manipulate indentations
	{
		"folke/snacks.nvim",
		opts = {
			scope = {
				enabled = true,
				keys = {
					jump = {}, -- Disable jumps TODO: Fix this
				},
			},
		},
	},
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- Find and replace in project
})

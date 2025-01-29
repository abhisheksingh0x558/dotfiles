local fs = vim.fs
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap

-- Plugin manager
local lazypath = fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")
opt.rtp:prepend(lazypath) -- Load plugin manager

-- Code style
g.editorconfig = true -- Editorconfig integration

-- Keymaps
g.mapleader = " " -- Leader key
g.maplocalleader = "\\" -- Local leader key
keymap.set("n", "<c-k>", "<up>") -- Command line prefix history search upward
keymap.set("n", "<c-j>", "<down>") -- Command line prefix history search downward
keymap.set("t", "<esc>", "<c-\\><c-n>") -- Switch from terminal mode to normal mode
keymap.set("t", "<c-\\><c-n>", "<esc>") -- Send escape key to program running in terminal buffer

require("lazy").setup({
	-- Keymaps
	-- Pairs of bracket keymaps
	{
		"tummetott/unimpaired.nvim",
		opts = {},
	},
	-- Manipulate comments
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- Manipulate surrounding pairs
	{
		"kylechui/nvim-surround",
		opts = {},
	},
	-- Exchange text
	{
		"gbprod/substitute.nvim",
		opts = {},
	},
	-- Manipulate text cases
	{
		"johmsalas/text-case.nvim",
		opts = {},
	},
	-- Navigate with search labels
	{
		"folke/flash.nvim",
		opts = {},
	},
	-- Manipulate alignments
	"Vonr/align.nvim",
	-- Find and replace in project
	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},
})

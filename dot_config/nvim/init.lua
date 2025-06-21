local fs = vim.fs
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap
local o = vim.o
local cmd = vim.cmd

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

-- UI/UX
opt.shortmess:append("I") -- Disable intro message
o.number = true -- Enable line numbering
o.cursorline = true -- Enable line highlighting
o.clipboard = "unnamedplus" -- Use system clipboard
o.ignorecase = true -- Ignore case while searching
o.smartcase = true -- Respect case if pattern has upper case characters
o.splitright = true -- Put new window towards right on vertical split
o.splitbelow = true -- Put new window towards bottom on horizontal split

-- Spell checker
o.spell = true

require("lazy").setup({
	-- Keymaps
	-- Pairs of bracket keymaps
	{
		"tummetott/unimpaired.nvim",
		opts = {},
	},
	-- Manipulate surrounding pairs
	{
		"kylechui/nvim-surround",
		opts = {},
	},

	-- UI/UX
	-- Theme
	{
		"catppuccin/nvim",
		config = function()
			cmd.colorscheme("catppuccin-mocha")
		end,
	},
	-- UI for diagnostics, references, telescope results, quickfix list and location list
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			focus = true, -- Move cursor to trouble window when open
		},
		keys = {
			-- Goto previous trouble entry
			{
				"[q",
				function()
					require("trouble").prev({ jump = true })
				end,
			},
			-- Goto next trouble entry
			{
				"]q",
				function()
					require("trouble").next({ jump = true })
				end,
			},
		},
	},
})

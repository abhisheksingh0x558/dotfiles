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

	-- UI/UX
	-- Theme
	{
		"catppuccin/nvim",
		config = function()
			cmd.colorscheme("catppuccin-mocha")
		end,
	},
	"MunifTanjim/nui.nvim", -- UI component library -- TODO: Use luarocks to manage this and remove from here
	"folke/noice.nvim", -- UI for messages, cmdline, and popupmenu
	"Bekaboo/dropbar.nvim", -- Breadcrumbs
	-- Cursor context
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
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
			-- Toggle project diagnostics
			{
				"<leader>od",
				function()
					require("trouble").toggle("diagnostics")
				end,
			},
			-- Toggle buffer diagnostics
			{
				"<leader>oD",
				function()
					require("trouble").toggle("diagnostics", { filter = { buf = 0 } })
				end,
			},
		},
	},
	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl", -- TODO: Remove this
		opts = {},
	},
	-- Highlight todo comments
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	"RRethy/vim-illuminate", --  Highlight word under cursor
	"HiPhish/rainbow-delimiters.nvim", -- Highlight brackets
})

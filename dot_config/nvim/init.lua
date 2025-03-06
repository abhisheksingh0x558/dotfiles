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
g.editorconfig = true -- EditorConfig integration

-- Keymaps
g.mapleader = " " -- Leader key
g.maplocalleader = "\\" -- Local leader key
keymap.set("n", "<c-k>", "<up>") -- Command line prefix history search upward
keymap.set("n", "<c-j>", "<down>") -- Command line prefix history search downward
keymap.set("t", "<esc>", "<c-\\><c-n>") -- Switch from terminal mode to normal mode
keymap.set("t", "<c-\\><c-n>", "<esc>") -- Send escape key to program running in terminal

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
	-- Collection of plugins
	{
		"folke/snacks.nvim",
		opts = {},
	},
	"echasnovski/mini.nvim",

	-- Keymaps
	{ "tummetott/unimpaired.nvim", opts = {} }, -- Pairs of bracket keymaps TODO: Remove this
	{ "numToStr/Comment.nvim", opts = {} }, -- Manipulate comments TODO: Remove this
	{ "kylechui/nvim-surround", opts = {} }, -- Manipulate surrounding pairs TODO: Remove this
	{ "gbprod/substitute.nvim", opts = {} }, -- Exchange text TODO: Remove this
	{ "johmsalas/text-case.nvim", opts = {} }, -- Manipulate text cases TODO: Remove this
	{ "folke/flash.nvim", opts = {} }, -- Navigate with search labels
	"Vonr/align.nvim", -- Manipulate alignments TODO: Remove this
	-- Manipulate indentations
	-- TODO: Do this with treesitter
	{
		"folke/snacks.nvim",
		opts = {
			scope = { enabled = true },
		},
	},
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- Find and replace in project

	-- UI/UX
	-- Theme
	{
		"catppuccin/nvim",
		config = function()
			cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} }, -- Icons
	"MunifTanjim/nui.nvim", -- UI component library -- TODO: Use luarocks to manage this and remove from here
	-- UI for messages, cmdline, and popupmenu
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline", -- Show command line at the bottom
			},
		},
	},
	{ "Bekaboo/dropbar.nvim", opts = {} }, -- Breadcrumbs
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} }, -- Cursor context
	-- UI for diagnostics, references, quickfix list and location list
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
			{ "<leader>od", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" }, -- Toggle buffer diagnostics
			{ "<leader>oD", "<cmd>Trouble diagnostics toggle<cr>" }, -- Toggle project diagnostics
		},
	},
	-- Indentation guides
	{
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
		},
	},
	-- Highlight todo comments TODO: Remove this
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "[t", '<cmd>lua require("todo-comments").jump_prev()<cr>' }, -- Goto previous todo
			{ "]t", '<cmd>lua require("todo-comments").jump_next()<cr>' }, -- Goto next todo
		},
	},
	"RRethy/vim-illuminate", --  Highlight word under cursor TODO: Remove this
	"HiPhish/rainbow-delimiters.nvim", -- Highlight brackets TODO: Remove this

	-- Autocompletion
	-- Autoclose pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"rafamadriz/friendly-snippets", -- Snippet collection
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
		opts = {
			keymap = { preset = "super-tab" }, -- Use tab for autocompletion
		},
	},

	-- Fuzzy finder
	{ "nvim-telescope/telescope.nvim", opts = {} }, -- TODO: Remove this
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				enabled = true,
				layout = {
					preset = "bottom", -- Show fuzzy finder at the bottom
				},
				sources = {
					files = {
						hidden = true, -- Show hidden files
					},
				},
			},
		},
		keys = {
			{ "<leader><space>", "<cmd>lua Snacks.picker.files()<cr>" }, -- Find files in current directory
			{ "<leader><tab>", "<cmd>lua Snacks.picker.buffers()<cr>" }, -- Find buffers
			{ "<leader><bs>", "<cmd>lua Snacks.picker.recent()<cr>" }, -- Find recent files
			{ "grr", "<cmd>lua Snacks.picker.lsp_references()<cr>" }, -- Find lsp references
			{ "gri", "<cmd>lua Snacks.picker.lsp_implementations()<cr>" }, -- Find lsp implementations
			{ "g/", "<cmd>lua Snacks.picker.lines()<cr>" }, -- Search current file
			{ "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>" }, -- Search project files
			{ "<m-x>", "<cmd>lua Snacks.picker.commands()<cr>" }, -- Search commands
		},
	},

	-- VCS integration
	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>" }, -- Open git client
		},
	},
	-- Git commands in file
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns blame<cr>" }, -- Blame
			{ "[c", "<cmd>Gitsigns nav_hunk prev<cr>" }, -- Goto previous hunk
			{ "]c", "<cmd>Gitsigns nav_hunk next<cr>" }, -- Goto next hunk
			{ "[C", "<cmd>Gitsigns nav_hunk first<cr>" }, -- Goto first hunk
			{ "]C", "<cmd>Gitsigns nav_hunk last<cr>" }, -- Goto last hunk
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			gitbrowse = { enabled = true },
		},
		keys = {
			{ "<leader>gB", "<cmd>lua Snacks.gitbrowser()<cr>" }, -- Open current file in browser
		},
	},
	{ "akinsho/git-conflict.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} }, -- Cycle diffs

	-- PKM tool
	"nvim-neorg/neorg", -- TODO: Enable defaults and concealer addons

	-- Filesystem manager
	-- Filesystem explorer in sidebar
	{
		"folke/snacks.nvim",
		opts = {
			explorer = { enabled = true },
		},
		keys = {
			{ "<leader>e", "<cmd>lua Snacks.explorer()<cr>" }, -- Toggle explorer for current file
		},
	},
	{ "stevearc/oil.nvim", opts = {} }, -- Filesystem explorer in buffer
	{ "chrisgrieser/nvim-genghis", opts = {} }, -- Commands for managing files and directories

	-- Terminal manager
	{
		"folke/snacks.nvim",
		opts = {
			terminal = { enabled = true },
		},
		keys = {
			{ "<leader>t", "<cmd>lua Snacks.terminal()<cr>" }, -- Toggle terminal
		},
	},
})

-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

-- Code style
vim.g.editorconfig = true -- EditorConfig integration

-- Keymaps
vim.g.mapleader = " " -- Leader key
vim.g.maplocalleader = "\\" -- Local leader key

-- UI/UX
vim.opt.shortmess:append("I") -- Disable intro message
vim.o.number = true -- Enable line numbering
vim.o.cursorline = true -- Enable line highlighting
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.ignorecase = true -- Ignore case while searching
vim.o.smartcase = true -- Respect case if pattern has upper case characters
vim.o.splitright = true -- Put new window towards right on vertical split
vim.o.splitbelow = true -- Put new window towards bottom on horizontal split

-- Spell checker
vim.o.spell = true

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

	-- UI/UX
	-- Theme
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
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
			{ "<Leader>od", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>" }, -- Toggle buffer diagnostics
			{ "<Leader>oD", "<Cmd>Trouble diagnostics toggle<CR>" }, -- Toggle project diagnostics
		},
	},
	-- Indentation guides
	{
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
		},
	},
	-- Highlight todo comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {},
		keys = {
			-- Goto previous todo
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
			},
			-- Goto next todo
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
			},
		},
	},
	-- Highlight lsp references
	{
		"RRethy/vim-illuminate",
		keys = {
			-- Goto previous reference
			{
				"[r",
				function()
					require("illuminate").goto_prev_reference(true)
				end,
			},
			-- Goto next reference
			{
				"]r",
				function()
					require("illuminate").goto_next_reference(true)
				end,
			},
		},
	},
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
			-- Find files in current directory
			{
				"<Leader> ",
				function()
					Snacks.picker.files()
				end,
			},
			-- Find buffers
			{
				"<Leader><Tab>",
				function()
					Snacks.picker.buffers()
				end,
			},
			-- Find recent files
			{
				"<Leader><BS>",
				function()
					Snacks.picker.recent()
				end,
			},
			-- Find lsp references
			{
				"grr",
				function()
					Snacks.picker.lsp_references()
				end,
			},
			-- Find lsp implementations
			{
				"gri",
				function()
					Snacks.picker.lsp_implementations()
				end,
			},
			-- Search current file
			{
				"g/",
				function()
					Snacks.picker.lines()
				end,
			},
			-- Search project files
			{
				"<Leader>/",
				function()
					Snacks.picker.grep()
				end,
			},
			-- Search commands
			{
				"<M-x>",
				function()
					Snacks.picker.commands()
				end,
			},
		},
	},

	-- VCS integration
	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		opts = {},
		keys = {
			{ "<Leader>gg", "<Cmd>Neogit<CR>" }, -- Open git client
		},
	},
	-- Git commands in file
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<Leader>gb", "<Cmd>Gitsigns blame<CR>" }, -- Blame
			{ "[c", "<Cmd>Gitsigns nav_hunk prev<CR>" }, -- Goto previous hunk
			{ "]c", "<Cmd>Gitsigns nav_hunk next<CR>" }, -- Goto next hunk
			{ "[C", "<Cmd>Gitsigns nav_hunk first<CR>" }, -- Goto first hunk
			{ "]C", "<Cmd>Gitsigns nav_hunk last<CR>" }, -- Goto last hunk
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			gitbrowse = { enabled = true },
		},
		keys = {
			-- Open git forge for current file in browser
			{
				"<Leader>gB",
				function()
					Snacks.gitbrowser()
				end,
			},
		},
	},
	{ "akinsho/git-conflict.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} }, -- Cycle diffs
})

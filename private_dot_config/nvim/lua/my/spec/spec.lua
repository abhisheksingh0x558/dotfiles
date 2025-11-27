-- Plugin specifications
return {
	-- Collection of plugins
	{
		"folke/snacks.nvim",
		opts = {
			-- Key mappings
			-- Manipulate indentations
			scope = {
				enabled = true,
				keys = {
					jump = {},
				},
			},

			-- UI/UX
			-- Indentation guides
			indent = { enabled = true },

			-- Fuzzy finder
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

			-- VCS integration
			-- Git client
			gitbrowse = { enabled = true },

			-- File system manager
			-- File system explorer in sidebar
			explorer = {
				enabled = true,
				sources = {
					files = {
						hidden = true, -- Show hidden files
					},
				},
			},

			-- Terminal manager
			terminal = { enabled = true },
		},
	},
	"echasnovski/mini.nvim",

	-- Lua libraries
	"kevinhwang91/promise-async", -- TODO: Use luarocks to manage this and remove from here
	"nvim-neotest/nvim-nio", -- TODO: Use luarocks to manage this and remove from here

	-- Lua transpiler
	{ "rktjmp/hotpot.nvim", opts = {} },

	-- Key mappings
	{ "numToStr/Comment.nvim", opts = {} }, -- Manipulate comments
	{ "kylechui/nvim-surround", opts = {} }, -- Manipulate surrounding pairs
	{ "gbprod/substitute.nvim", opts = {} }, -- Exchange text
	{ "johmsalas/text-case.nvim", opts = {} }, -- Manipulate text cases
	{ "folke/flash.nvim", opts = {} }, -- Navigate with search labels
	"Vonr/align.nvim", -- Manipulate alignments
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- Find and replace in project

	-- UI/UX
	-- Theme
	"folke/tokyonight.nvim",
	{ "nvim-lualine/lualine.nvim", opts = {} }, -- Statusline
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
	},
	-- Highlight to do comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {},
	},
	-- Highlight lsp references
	"RRethy/vim-illuminate",
	"HiPhish/rainbow-delimiters.nvim", -- Highlight brackets
	{ "folke/which-key.nvim", opts = {} }, --  Key mapping pop up helper

	-- Autocompletion
	-- Auto close pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"rafamadriz/friendly-snippets", -- Snippet collection
	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = { preset = "super-tab" }, -- Use tab for autocompletion
		},
	},

	-- VCS integration
	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		opts = {},
	},
	-- Git commands in file
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
	},
	{ "akinsho/git-conflict.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} }, -- Cycle diffs

	-- PKM tool
	{
		"nvim-neorg/neorg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {}, -- Convert markup to icons
			},
		},
	},

	-- File system manager
	{ "stevearc/oil.nvim", opts = {} }, -- File system explorer in buffer
	{ "chrisgrieser/nvim-genghis", opts = {} }, -- Commands for managing files and directories

	-- REPL manager
	{ "Vigemus/iron.nvim", opts = {} },

	-- Snippet executer
	{
		"michaelb/sniprun",
		build = "sh install.sh",
		opts = {},
	},

	-- Folding
	{ "kevinhwang91/nvim-ufo", opts = {} },

	-- Outliner
	{ "stevearc/aerial.nvim", opts = {} },

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main", -- TODO: Remove this when main is set as default branch
		build = ":TSUpdate",
	},
	-- Text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- TODO: Remove this when main is set as default branch
		opts = {
			select = {
				lookahead = true, -- Automatically jump forward to text object
			},
		},
	},

	-- LSP integration
	"neovim/nvim-lspconfig",

	-- Linter
	"mfussenegger/nvim-lint",

	-- Formatter
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
		},
	},

	-- Test runner
	{ "nvim-neotest/neotest", opts = {} },

	-- Debugger
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", opts = {} },
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },

	-- AI integration
	-- Model
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
	{ "olimorris/codecompanion.nvim", opts = {} }, -- Chat interface

	-- GitHub client
	{
		"pwntester/octo.nvim",
		opts = {
			picker = "snacks", -- Fuzzy finder
		},
	},
}

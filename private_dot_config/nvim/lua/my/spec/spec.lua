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
}

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
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_strategy = "bottom_pane", -- Open finder at bottom
					sorting_strategy = "ascending", -- Sort results in ascending order
				},
			})
			-- Load extensions
			telescope.load_extension("fzf")
		end,
		keys = {
			-- Find files in current directory
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files()
				end,
			},
			-- Find buffers
			{
				"<leader><tab>",
				function()
					require("telescope.builtin").buffers()
				end,
			},
			-- Find recent files
			{
				"<leader><tab>",
				function()
					require("telescope.builtin").oldfiles()
				end,
			},
			-- Find lsp references
			{
				"grr",
				function()
					require("telescope.builtin").lsp_references()
				end,
			},
			-- Find lsp implementations
			{
				"gri",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
			},
			-- Search current buffer
			{
				"g/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
			},
			-- Search project files
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			-- Search commands
			{
				"<m-x>",
				function()
					require("telescope.builtin").commands()
				end,
			},
		},
		-- TODO: Use luarocks to manage this and remove from here
		dependencies = {
			-- Fzf based native sorter
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},

	-- VCS integration
	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		keys = {
			-- Open git client
			{
				"<leader>gg",
				function()
					require("neogit").open()
				end,
			},
		},
	},
	-- Git commands in buffer
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
		keys = {
			-- Blame
			{
				"<leader>gb",
				function()
					require("gitsigns").blame()
				end,
			},
			-- Goto previous hunk
			{
				"[c",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
			},
			-- Goto next hunk
			{
				"]c",
				function()
					require("gitsigns").nav_hunk("next")
				end,
			},
			-- Goto first hunk
			{
				"[c",
				function()
					require("gitsigns").nav_hunk("first")
				end,
			},
			-- Goto last hunk
			{
				"]c",
				function()
					require("gitsigns").nav_hunk("last")
				end,
			},
		},
	},
	{
		"akinsho/git-conflict.nvim",
		opts = {},
	},
	"sindrets/diffview.nvim", -- Cycle diffs

	-- PKM tool
	"nvim-neorg/neorg", -- TODO: Enable defaults and concealer addons
})

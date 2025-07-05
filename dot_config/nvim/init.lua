local fs = vim.fs
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap
local o = vim.o
local cmd = vim.cmd
local api = vim.api
local lsp = vim.lsp
local treesitter = vim.treesitter

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

-- Formatter
o.formatexpr = "v:lua.require'conform'.formatexpr()"

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
				"<leader><bs>",
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
				"[C",
				function()
					require("gitsigns").nav_hunk("first")
				end,
			},
			-- Goto last hunk
			{
				"]C",
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

	-- Filesystem manager
	-- Filesystem explorer in sidebar
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			-- Toggle explorer
			{
				"<leader>e",
				function()
					require("neo-tree.command")._command("toggle")
				end,
			},
		},
	},
	"chrisgrieser/nvim-genghis", -- Commands for managing files and directories

	-- Terminal manager
	{
		"akinsho/toggleterm.nvim",
		opts = {},
		keys = {
			-- Toggle explorer
			{
				"<leader>t",
				function()
					require("toggleterm").toggle_command()
				end,
			},
		},
	},

	-- REPL manager
	{
		"Vigemus/iron.nvim",
		opts = {},
	},

	-- Snippet executer
	{
		"michaelb/sniprun",
		build = "cargo build --release",
	},

	-- Folding
	"kevinhwang91/nvim-ufo",

	-- Outliner
	{
		"stevearc/aerial.nvim",
		opts = {},
		keys = {
			-- Toggle outline
			{
				"gO",
				function()
					require("aerial").toggle()
				end,
			},
		},
	},

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- TODO: Remove this when main is set as default branch
		opts = {
			auto_install = true, -- Install parsers when required
			sync_install = true, -- Install parsers synchronously
			highlight = { enable = true }, -- Enable syntax highlighting
		},
		config = function()
			treesitter.language.register("bash", "zsh") -- TODO: Remove this when zsh parser is supported officially
		end,
	},
	-- Text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- TODO: Remove this when main is set as default branch
		-- TODO: Define keymaps otherwise these don't work and document each section below
		opts = {
			select = { enable = true },
			move = { enable = true },
			swap = { enable = true },
		},
	},

	-- LSP integration
	"neovim/nvim-lspconfig",

	-- Linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			-- Triggers for linters
			api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = api.nvim_create_augroup("lint", {}),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
		},
	},

	-- Test runner
	"nvim-neotest/neotest",

	-- Debugger
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		opts = {},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	-- Register debuggers
	-- Go
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},

	-- AI integration
	{
		"olimorris/codecompanion.nvim",
		opts = {},
	},

	-- GitHub client
	"pwntester/octo.nvim",

	-- Lua support
	"folke/lazydev.nvim", -- TODO: Disable server triggered

	-- Haskell support
	"mrcjkb/haskell-tools.nvim", -- TODO: Disable server triggered

	-- Rust support
	"mrcjkb/rustaceanvim", -- TODO: Disable server triggered
	{
		"Saecki/crates.nvim",
		opts = {},
	},

	-- Go support
	"ray-x/go.nvim", -- TODO: Disable server triggered
})

-- Language configurations
local languages = {
	-- Nushell
	nu = {
		language_server = "nushell",
		-- TODO: Add linters
		formatters = { "nufmt" },
	},

	-- Zsh
	zsh = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- Bash
	bash = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- TODO: Setup Just

	-- TODO: Setup Make

	-- Nix
	nix = {
		language_server = "nil_ls",
		linters = { "statix" },
		formatters = { "nixfmt" },
	},

	-- Lua
	lua = {
		language_server = "lua_ls",
		linters = { "luacheck" },
		formatters = { "stylua" },
	},

	-- Haskell
	haskell = {
		language_server = "hls",
		linters = { "hlint" },
		formatters = { "fourmolu" },
	},

	-- TODO: Setup Common Lisp

	-- TODO: Setup Zig

	-- Rust
	rust = {
		language_server = "rust_analyzer",
		linters = { "clippy" },
		formatters = { "rustfmt" },
	},

	-- TODO: Setup Racket

	-- Go
	go = {
		language_server = "gopls",
		linters = { "staticcheck" },
		formatters = { "gofumpt" },
	},

	-- Scala
	scala = {
		language_server = "metals",
		-- TODO: Add linters
		formatters = { "scalafmt" },
	},

	-- TODO: Setup Clojure

	-- TODO: Setup Kotlin

	-- PureScript
	purescript = {
		language_server = "purescriptls",
		-- TODO: Add linters
		formatters = { "purs-tidy" },
	},

	-- C++
	cpp = {
		language_server = "clangd",
		linters = { "cppcheck" },
		formatters = { "clang-format" },
	},

	-- Python
	python = {
		language_server = "ruff", -- TODO: Replace with ty
		linters = { "ruff" },
		formatters = { "ruff_format" },
	},
}

-- Setup language tools
require("lint").linters_by_ft = {}
local function setup_language(filetype, config)
	-- Register language server
	if config.language_server then
		lsp.enable(config.language_server)
	end
	-- Register linter
	if config.linters then
		require("lint").linters_by_ft[filetype] = config.linters
	end
	-- Register formatter
	if config.formatters then
		require("conform").formatters_by_ft[filetype] = config.formatters
	end
end

-- Setup tools for all configured languages
for filetype, config in pairs(languages) do
	setup_language(filetype, config)
end

local fs = vim.fs
local opt = vim.opt
local g = vim.g
local keymap = vim.keymap
local o = vim.o
local cmd = vim.cmd
local api = vim.api
local treesitter = vim.treesitter
local lsp = vim.lsp

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

-- Formatter integration
o.formatexpr = "v:lua.require'conform'.formatexpr()"

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

	-- Autocompletion
	-- Autoclose pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ "rafamadriz/friendly-snippets" }, -- Snippet collection
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
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},

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

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = true, -- Install parsers synchronously
				highlight = { enable = true }, -- Enable syntax highlighting
				-- Parsers to install
				ensure_installed = {
					"nu", -- Nushell
					-- TODO: Setup zsh
					"bash", -- Bash
					"just", -- Just
					"make", -- Make
					"nix", -- Nix
					"lua", -- Lua
					"haskell", -- Haskell
					"commonlisp", -- Common Lisp
					"zig", -- Zig
					"rust", -- Rust
					"racket", -- Racket
					"go", -- Go
				},
			})
			treesitter.language.register("bash", "zsh") -- TODO: Remove this when zsh parser is supported officially
		end,
	},

	-- LSP integration
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Register language servers
			lsp.enable("nushell") -- Nushell
			lsp.enable("bashls") -- Zsh and Bash # TODO: Enable for zsh
			lsp.enable("nil_ls") -- Nix
			lsp.enable("lua_ls") -- Lua
			lsp.enable("hls") -- Haskell
			lsp.enable("rust_analyzer") -- Rust
			lsp.enable("gopls") -- Go
		end,
	},

	-- Linter integration
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
			-- Register linters
			lint.linters_by_ft = {
				zsh = { "shellcheck" }, -- Zsh
				bash = { "shellcheck" }, -- Bash
				nix = { "statix" }, -- Nix
				lua = { "luacheck" }, -- Lua
				haskell = { "hlint" }, -- Haskell
				rust = { "clippy" }, -- Rust
				go = { "staticcheck" }, -- Go
			}
		end,
	},

	-- Formatter integration
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
			-- Register formatters
			formatters_by_ft = {
				nu = { "nufmt" }, -- Nushell
				zsh = { "shfmt" }, -- Zsh
				bash = { "shfmt" }, -- Bash
				nix = { "nixfmt" }, -- Nix
				lua = { "stylua" }, -- Lua
				haskell = { "fourmolu" }, -- Haskell
				rust = { "rustfmt" }, -- Rust
				go = { "gofumpt" }, -- Go
			},
		},
	},

	-- Debugger integration
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		opts = {},
		dependencies = {
			{ "nvim-neotest/nvim-nio" },
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	-- Register debuggers
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},

	-- AI integration
	{
		"yetone/avante.nvim",
	},

	-- GitHub client
	-- {
	-- 	"pwntester/octo.nvim",
	-- },

	-- Rust support
	"mrcjkb/rustaceanvim", -- TODO: Disable server triggered
	{
		"Saecki/crates.nvim",
		opts = {},
	},
})

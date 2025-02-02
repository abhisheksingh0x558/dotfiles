local fs = vim.fs
local uv = vim.uv
local system = vim.system
local opt = vim.opt
local g = vim.g
local o = vim.o
local cmd = vim.cmd
local api = vim.api

-- Plugin manager
local lazypath = fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- Install plugin manager
if not uv.fs_stat(lazypath) then
	local result = system({ "git", "clone", lazyrepo, lazypath }):wait()
	if result.code ~= 0 then
		os.exit(result.code)
	end
end
-- Load plugin manager
opt.rtp:prepend(lazypath)

-- Code style
g.editorconfig = true -- Editorconfig integration

-- Keymaps
g.mapleader = " " -- Leader key
g.maplocalleader = "\\" -- Local leader key

-- UI/UX
opt.shortmess:append("I") -- Disable intro message
o.number = true -- Enable line numbering
o.cursorline = true -- Enable line highlighting
o.clipboard = "unnamedplus" -- Use system clipboard
o.ignorecase = true -- Ignore case while searching
o.smartcase = true -- Respect case if pattern has upper case characters
o.splitright = true -- Put new window towards right on vertical split
o.splitbelow = true -- Put new window towards bottom on horizontal split

require("lazy").setup({
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
			-- Find lsp references
			{
				"grr",
				function()
					require("trouble").toggle("lsp_references")
				end,
			},
			-- Find lsp implementations
			{
				"gri",
				function()
					require("trouble").toggle("lsp_implementations")
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
		},
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Fzf based native sorter
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
				"<leader>g",
				function()
					require("neogit").open()
				end,
			},
		},
	},
	-- Git commands in buffer
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		keys = {
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
		},
	},
	{
		"akinsho/git-conflict.nvim",
		opts = {
			default_mappings = {
				none = "n", -- Choose none
			},
		},
	},

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = true, -- Install parsers synchronously
				highlight = { enable = true }, -- Enable syntax highlighting
			})
		end,
	},

	-- LSP integration
	"neovim/nvim-lspconfig",

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
		end,
	},

	-- Formatter integration
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
		},
	},
})

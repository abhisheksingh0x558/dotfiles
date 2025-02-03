local opt = vim.opt
local fn = vim.fn
local g = vim.g
local o = vim.o
local cmd = vim.cmd
local api = vim.api

-- Plugin manager
opt.rtp:prepend(fn.stdpath("data") .. "/lazy/lazy.nvim") -- Add plugin manager to runtime path

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
	{
		-- Theme
		"catppuccin/nvim",
		config = function()
			cmd.colorscheme("catppuccin-mocha")
		end,
	},

	-- Autocompletion
	-- Autoclose pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			-- Autocompletion sources
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<tab>"] = cmp.mapping.confirm({ select = true }), -- Select entry from autocompletion popup
					["<cr>"] = cmp.mapping.confirm({ select = true }), -- Select entry from autocompletion popup
				}),
			})
		end,
		dependencies = {
			-- Autocompletion sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
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
			-- Find project files
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files()
				end,
			},
		},
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Fzf based native sorter
	},

	-- VCS integration
	{
		-- Git client
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

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true, -- Automatically install parsers
				highlight = { enable = true }, -- Enable syntax highlighting
				-- Parsers to install
				ensure_installed = {
					"nix",
				},
			})
		end,
	},

	-- LSP integration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Register language servers
			lspconfig.nil_ls.setup({})
		end,
	},

	-- Linter integration
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			-- Triggers for linters
			api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				-- Autocommand group for linting
				group = api.nvim_create_augroup("linting", {}),
				callback = function()
					lint.try_lint()
				end,
			})
			-- Register linters
			lint.linters_by_ft = {
				nix = { "deadnix" },
			}
		end,
	},

	-- Formatter integration
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
			-- File specific formatters
			formatters_by_ft = {
				nix = { "nixfmt" },
			},
		},
	},
})

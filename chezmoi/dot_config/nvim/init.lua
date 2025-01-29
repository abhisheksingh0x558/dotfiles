local opt = vim.opt
local fn = vim.fn
local g = vim.g
local o = vim.o
local cmd = vim.cmd

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
})

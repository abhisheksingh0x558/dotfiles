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
})

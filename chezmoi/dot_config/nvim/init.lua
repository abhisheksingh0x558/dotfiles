local opt = vim.opt
local fn = vim.fn
local g = vim.g

-- Plugin manager
opt.rtp:prepend(fn.stdpath("data") .. "/lazy/lazy.nvim") -- Add plugin manager to runtime path

-- Code style
g.editorconfig = true -- Editorconfig integration

-- Keymaps
g.mapleader = " " -- Leader key
g.maplocalleader = "\\" -- Local leader key

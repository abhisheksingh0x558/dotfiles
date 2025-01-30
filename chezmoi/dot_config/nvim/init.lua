local opt = vim.opt
local fn = vim.fn

-- Plugin manager
opt.rtp:prepend(fn.stdpath("data") .. "/lazy/lazy.nvim") -- Add plugin manager to runtime path

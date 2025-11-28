vim.opt.shortmess:append("I") -- Disable intro message

vim.opt.number = true -- Enable line numbering
vim.opt.cursorline = true -- Enable line highlighting

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.ignorecase = true -- Ignore case while searching
vim.opt.smartcase = true -- Respect case if pattern has upper case characters otherwise ignore it

vim.opt.splitright = true -- Put new window towards right on vertical split
vim.opt.splitbelow = true -- Put new window towards bottom on horizontal split

return {}

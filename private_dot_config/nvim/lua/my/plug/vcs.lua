local snacks = Snacks

vim.keymap.set("n", "<Leader>gg", "<Cmd>Neogit<CR>") -- Open git client

vim.keymap.set("n", "<Leader>gb", "<Cmd>Gitsigns blame<CR>") -- Blame
vim.keymap.set("n", "]c", "<Cmd>Gitsigns nav_hunk next<CR>") -- Go to next hunk
vim.keymap.set("n", "[c", "<Cmd>Gitsigns nav_hunk prev<CR>") -- Go to previous hunk
vim.keymap.set("n", "]C", "<Cmd>Gitsigns nav_hunk last<CR>") -- Go to last hunk
vim.keymap.set("n", "[C", "<Cmd>Gitsigns nav_hunk first<CR>") -- Go to first hunk

-- Open git forge for current file in browser
vim.keymap.set("n", "<Leader>gB", function()
	snacks.gitbrowser()
end)

return {}

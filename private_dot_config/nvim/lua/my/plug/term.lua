local snacks = Snacks

-- Toggle terminal
vim.keymap.set("n", "<Leader>t", function()
	snacks.terminal()
end)

return {}

local snacks = Snacks

-- Toggle explorer for current file
vim.keymap.set("n", "<Leader>e", function()
	snacks.explorer()
end)

return {}

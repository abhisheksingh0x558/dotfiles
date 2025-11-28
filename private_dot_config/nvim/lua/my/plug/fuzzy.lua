local picker = Snacks.picker

-- Find files in current directory
vim.keymap.set("n", "<Leader> ", function()
	picker.files()
end)
-- Find buffers
vim.keymap.set("n", "<Leader><Tab>", function()
	picker.buffers()
end)
-- Find recent files
vim.keymap.set("n", "<Leader><BS>", function()
	picker.recent()
end)
-- Find lsp references
vim.keymap.set("n", "grr", function()
	picker.lsp_references()
end)
-- Find lsp implementations
vim.keymap.set("n", "gri", function()
	picker.lsp_implementations()
end)
-- Search current file
vim.keymap.set("n", "g/", function()
	picker.lines()
end)
-- Search project files
vim.keymap.set("n", "<Leader>/", function()
	picker.grep()
end)
-- Search commands
vim.keymap.set("n", "<M-x>", function()
	picker.commands()
end)

return {}

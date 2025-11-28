local tokyonight = require("tokyonight")
local trouble = require("trouble")
local todo_comments = require("todo-comments")
local illuminate = require("illuminate")

tokyonight.load() -- Load theme

-- Go to next trouble entry
vim.keymap.set("n", "]q", function()
	trouble.next({ jump = true })
end)
-- Go to previous trouble entry
vim.keymap.set("n", "[q", function()
	trouble.prev({ jump = true })
end)
vim.keymap.set("n", "<Leader>od", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>") -- Toggle buffer diagnostics
vim.keymap.set("n", "<Leader>oD", "<Cmd>Trouble diagnostics toggle<CR>") -- Toggle project diagnostics

-- Go to next to do
vim.keymap.set("n", "]t", function()
	todo_comments.jump_next()
end)
-- Go to previous to do
vim.keymap.set("n", "[t", function()
	todo_comments.jump_prev()
end)

-- Go to next reference
vim.keymap.set("n", "]r", function()
	illuminate.goto_next_reference(true)
end)
-- Go to previous reference
vim.keymap.set("n", "[r", function()
	illuminate.goto_prev_reference(true)
end)

return {}

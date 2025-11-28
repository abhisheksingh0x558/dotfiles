local M = {}

-- Make last exchange dot repeatable
local function replay_exchange(count)
	local func = vim.go.operatorfunc
	vim.go.operatorfunc = ""
	vim.cmd.normal((count or "") .. "g@l")
	vim.go.operatorfunc = func
end

-- Exchange current line with next line
function M.exchange_next()
	local count = vim.v.count1
	vim.cmd("move +" .. count)
	vim.cmd.normal({ "==", bang = true })
	replay_exchange(count)
end

-- Exchange current line with previous line
function M.exchange_previous()
	local count = vim.v.count1
	vim.cmd("move .-" .. (count + 1))
	vim.cmd.normal({ "==", bang = true })
	replay_exchange(count)
end

vim.g.mapleader = " " -- Leader key
vim.g.maplocalleader = "\\" -- Local leader key

vim.keymap.set("n", "<C-k>", "<Up>") -- Command line prefix history search upward
vim.keymap.set("n", "<C-j>", "<Down>") -- Command line prefix history search downward

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Switch from terminal mode to normal mode
vim.keymap.set("t", "<C-\\><C-n>", "<Esc>") -- Send escape key to program running in terminal

-- Exchange current line with next line
vim.keymap.set("n", "<M-j>", function()
	vim.go.operatorfunc = "v:lua.require'my.core.keymap'.exchange_next"
	return "g@l"
end, { expr = true })
-- Exchange current line with previous line
vim.keymap.set("n", "<M-k>", function()
	vim.go.operatorfunc = "v:lua.require'my.core.keymap'.exchange_previous"
	return "g@l"
end, { expr = true })
vim.keymap.set("i", "<M-j>", "<Esc><Cmd>move +1<CR>==gi") -- Exchange current line with next line
vim.keymap.set("i", "<M-k>", "<Esc><Cmd>move -2<CR>==gi") -- Exchange current line with previous line
vim.keymap.set("v", "<M-k>", "<Esc><Cmd>'<,'>move '<--<CR>gv=gv") -- Exchange current line with previous line
vim.keymap.set("v", "<M-j>", "<Esc><Cmd>'<,'>move '>+<CR>gv=gv") -- Exchange current line with next line

return M

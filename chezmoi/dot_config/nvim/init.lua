local fs = vim.fs
local uv = vim.uv
local system = vim.system
local opt = vim.opt
local g = vim.g

-- Plugin manager
local lazypath = fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- Install plugin manager
if not uv.fs_stat(lazypath) then
	local result = system({ "git", "clone", lazyrepo, lazypath }):wait()
	if result.code ~= 0 then
		os.exit(result.code)
	end
end
-- Load plugin manager
opt.rtp:prepend(lazypath)

-- Code style
g.editorconfig = true -- Editorconfig integration

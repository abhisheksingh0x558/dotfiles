-- Load plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim"))
local lazy = require("lazy")

-- Load modules
local function load(directory)
	local namespace = directory:match(".*/lua/(.*)"):gsub("/", ".")
	local modules = vim.fs.find(function(name)
		return name:match("%.lua$")
	end, { type = "file", path = directory, limit = math.huge })
	for _, module in ipairs(modules) do
		require(namespace .. "." .. module:match("([^/]+)%.lua$"))
	end
end

-- Load core modules
load(vim.fn.stdpath("config") .. "/lua/my/core")

-- Setup plugins
lazy.setup({ import = "my.spec" })

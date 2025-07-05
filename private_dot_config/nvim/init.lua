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

-- Load plugin modules
load(vim.fn.stdpath("config") .. "/lua/my/plug")

-- Language configurations
local languages = {
	-- Nushell
	nu = {
		language_server = "nushell",
		-- TODO: Add linters
		-- TODO: Add formatters
	},

	-- Zsh
	zsh = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- Bash
	bash = {
		language_server = "bashls",
		linters = { "shellcheck" },
		formatters = { "shfmt" },
	},

	-- Just
	just = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "just" },
	},

	-- TODO: Setup Make

	-- Nix
	nix = {
		language_server = "nil_ls",
		linters = { "statix" },
		formatters = { "nixfmt" },
	},

	-- Lua
	lua = {
		language_server = "lua_ls",
		linters = { "luacheck" },
		formatters = { "stylua" },
	},

	-- Fennel
	fennel = {
		language_server = "fennel_ls",
		linters = { "fennel" },
		formatters = { "fnlfmt" },
	},

	-- Haskell
	haskell = {
		language_server = "hls",
		linters = { "hlint" },
		formatters = { "fourmolu" },
	},

	-- TODO: Setup Common Lisp

	-- TODO: Setup Zig

	-- Rust
	rust = {
		language_server = "rust_analyzer",
		linters = { "clippy" },
		formatters = { "rustfmt" },
	},

	-- TODO: Setup Racket

	-- Go
	go = {
		language_server = "gopls",
		linters = { "staticcheck" },
		formatters = { "gofumpt" },
	},
}

-- Setup language tools
require("lint").linters_by_ft = {}
local function setup_language(filetype, config)
	-- Install treesitter parser
	local installed = false
	for _, parser in ipairs(require("nvim-treesitter").get_installed()) do
		if filetype == parser then
			installed = true
		end
	end
	if not installed then
		require("nvim-treesitter").install(filetype)
	end
	-- Register language server
	if config.language_server and vim.fn.executable(config.language_server) then
		vim.lsp.enable(config.language_server)
	end
	-- Register linter
	local linters = {}
	for _, linter in ipairs(config.linters or {}) do
		if vim.fn.executable(linter) then
			table.insert(linters, linter)
		end
	end
	if linters then
		require("lint").linters_by_ft[filetype] = linters
	end
	-- Register formatter
	local formatters = {}
	for _, formatter in ipairs(config.formatters or {}) do
		if vim.fn.executable(formatter) then
			table.insert(formatters, formatter)
		end
	end
	if formatters then
		require("conform").formatters_by_ft[filetype] = formatters
	end
end

-- Setup tools for all configured languages
local filetypes = {}
for filetype, config in pairs(languages) do
	table.insert(filetypes, filetype)
	setup_language(filetype, config)
end

-- Enabled treesitter syntax highlighting and indentation
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("my-treesitter-highlight", {}),
	pattern = filetypes,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

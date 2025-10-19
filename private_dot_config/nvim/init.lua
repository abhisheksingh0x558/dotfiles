-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

-- Code style
vim.g.editorconfig = true -- EditorConfig integration

-- Keymaps
vim.g.mapleader = " " -- Leader key
vim.g.maplocalleader = "\\" -- Local leader key
vim.keymap.set("n", "<C-k>", "<Up>") -- Command line prefix history search upward
vim.keymap.set("n", "<C-j>", "<Down>") -- Command line prefix history search downward
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Switch from terminal mode to normal mode
vim.keymap.set("t", "<C-\\><C-n>", "<Esc>") -- Send escape key to program running in terminal
vim.keymap.set("n", "<M-k>", "<Cmd>move --<CR>") -- Exchange current line with previous line TODO: Allow count, dot repeat and indent
vim.keymap.set("n", "<M-j>", "<Cmd>move +<CR>") -- Exchange current line with next line TODO: Allow count, dot repeat and indent
vim.keymap.set("i", "<M-k>", "<Cmd>move --<CR>") -- Exchange current line with previous line TODO: Allow count, dot repeat, indent, and goto last insert point
vim.keymap.set("i", "<M-j>", "<Cmd>move +<CR>") -- Exchange current line with next line TODO: Allow count, dot repeat, indent, and goto last insert point
vim.keymap.set("v", "<M-k>", "<Esc><Cmd>'<,'>move '<--<CR>") -- Exchange current line with previous line TODO: Allow count, dot repeat, indent, and select last visual selection
vim.keymap.set("v", "<M-j>", "<Esc><Cmd>'<,'>move '>+<CR>") -- Exchange current line with next line TODO: Allow count, dot repeat, indent, and select last visual selection
-- Goto previous error
vim.keymap.set("n", "[e", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -vim.v.count1 })
end)
-- Goto next error
vim.keymap.set("n", "]e", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = vim.v.count1 })
end)
-- Goto first error
vim.keymap.set("n", "[E", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -vim._maxint, wrap = false })
end)
-- Goto last error
vim.keymap.set("n", "]E", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = vim._maxint, wrap = false })
end)
-- Goto previous warning
vim.keymap.set("n", "[w", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = -vim.v.count1 })
end)
-- Goto next warning
vim.keymap.set("n", "]w", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = vim.v.count1 })
end)
-- Goto first warning
vim.keymap.set("n", "[W", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = -vim._maxint, wrap = false })
end)
-- Goto last warning
vim.keymap.set("n", "]W", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = vim._maxint, wrap = false })
end)
-- Goto previous info
vim.keymap.set("n", "[i", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.INFO, count = -vim.v.count1 })
end)
-- Goto next info
vim.keymap.set("n", "]i", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.INFO, count = vim.v.count1 })
end)
-- Goto first info
vim.keymap.set("n", "[I", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.INFO, count = -vim._maxint, wrap = false })
end)
-- Goto last info
vim.keymap.set("n", "]I", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.INFO, count = vim._maxint, wrap = false })
end)
-- Goto previous hint
vim.keymap.set("n", "[h", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.HINT, count = -vim.v.count1 })
end)
-- Goto next hint
vim.keymap.set("n", "]h", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.HINT, count = vim.v.count1 })
end)
-- Goto first hint
vim.keymap.set("n", "[H", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.HINT, count = -vim._maxint, wrap = false })
end)
-- Goto last hint
vim.keymap.set("n", "]H", function()
	vim.diagnostic.jump({ severity = vim.diagnostic.severity.HINT, count = vim._maxint, wrap = false })
end)

-- UI/UX
vim.opt.shortmess:append("I") -- Disable intro message
vim.opt.number = true -- Enable line numbering
vim.opt.cursorline = true -- Enable line highlighting
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.ignorecase = true -- Ignore case while searching
vim.opt.smartcase = true -- Respect case if pattern has upper case characters otherwise ignore it
vim.opt.splitright = true -- Put new window towards right on vertical split
vim.opt.splitbelow = true -- Put new window towards bottom on horizontal split

-- Spell checker
vim.opt.spell = true

require("lazy").setup({
	-- Collection of plugins
	{ "folke/snacks.nvim", opts = {} },
	"echasnovski/mini.nvim",

	-- Lua libraries
	"nvim-neotest/nvim-nio", -- TODO: Use luarocks to manage this and remove from here

	-- Lua transpiler
	{ "rktjmp/hotpot.nvim", opts = {} },

	-- Keymaps
	{ "numToStr/Comment.nvim", opts = {} }, -- Manipulate comments TODO: Remove this
	{ "kylechui/nvim-surround", opts = {} }, -- Manipulate surrounding pairs TODO: Remove this
	{ "gbprod/substitute.nvim", opts = {} }, -- Exchange text TODO: Remove this
	{ "johmsalas/text-case.nvim", opts = {} }, -- Manipulate text cases TODO: Remove this
	{ "folke/flash.nvim", opts = {} }, -- Navigate with search labels
	"Vonr/align.nvim", -- Manipulate alignments TODO: Remove this
	-- Manipulate indentations
	{
		"folke/snacks.nvim",
		opts = {
			scope = {
				enabled = true,
				keys = {
					jump = {}, -- Disable jumps TODO: Fix this
				},
			},
		},
	},
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- Find and replace in project

	-- UI/UX
	-- Theme
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} }, -- Icons
	"MunifTanjim/nui.nvim", -- UI component library -- TODO: Use luarocks to manage this and remove from here
	-- UI for messages, cmdline, and popupmenu
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				view = "cmdline", -- Show command line at the bottom
			},
		},
	},
	{ "Bekaboo/dropbar.nvim", opts = {} }, -- Breadcrumbs
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} }, -- Cursor context
	-- UI for diagnostics, references, quickfix list and location list
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			focus = true, -- Move cursor to trouble window when open
		},
		keys = {
			-- Goto previous trouble entry
			{
				"[q",
				function()
					require("trouble").prev({ jump = true })
				end,
			},
			-- Goto next trouble entry
			{
				"]q",
				function()
					require("trouble").next({ jump = true })
				end,
			},
			{ "<Leader>od", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>" }, -- Toggle buffer diagnostics
			{ "<Leader>oD", "<Cmd>Trouble diagnostics toggle<CR>" }, -- Toggle project diagnostics
		},
	},
	-- Indentation guides
	{
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
		},
	},
	-- Highlight todo comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		opts = {},
		keys = {
			-- Goto previous todo
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
			},
			-- Goto next todo
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
			},
		},
	},
	-- Highlight lsp references
	{
		"RRethy/vim-illuminate",
		keys = {
			-- Goto previous reference
			{
				"[r",
				function()
					require("illuminate").goto_prev_reference(true)
				end,
			},
			-- Goto next reference
			{
				"]r",
				function()
					require("illuminate").goto_next_reference(true)
				end,
			},
		},
	},
	"HiPhish/rainbow-delimiters.nvim", -- Highlight brackets TODO: Remove this

	-- Autocompletion
	-- Autoclose pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"rafamadriz/friendly-snippets", -- Snippet collection
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
		opts = {
			keymap = { preset = "super-tab" }, -- Use tab for autocompletion
		},
	},

	-- Fuzzy finder
	{ "nvim-telescope/telescope.nvim", opts = {} }, -- TODO: Remove this
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				enabled = true,
				layout = {
					preset = "bottom", -- Show fuzzy finder at the bottom
				},
				sources = {
					files = {
						hidden = true, -- Show hidden files
					},
				},
			},
		},
		keys = {
			-- Find files in current directory
			{
				"<Leader> ",
				function()
					Snacks.picker.files()
				end,
			},
			-- Find buffers
			{
				"<Leader><Tab>",
				function()
					Snacks.picker.buffers()
				end,
			},
			-- Find recent files
			{
				"<Leader><BS>",
				function()
					Snacks.picker.recent()
				end,
			},
			-- Find lsp references
			{
				"grr",
				function()
					Snacks.picker.lsp_references()
				end,
			},
			-- Find lsp implementations
			{
				"gri",
				function()
					Snacks.picker.lsp_implementations()
				end,
			},
			-- Search current file
			{
				"g/",
				function()
					Snacks.picker.lines()
				end,
			},
			-- Search project files
			{
				"<Leader>/",
				function()
					Snacks.picker.grep()
				end,
			},
			-- Search commands
			{
				"<M-x>",
				function()
					Snacks.picker.commands()
				end,
			},
		},
	},

	-- VCS integration
	-- Git client
	{
		"NeogitOrg/neogit",
		lazy = false,
		opts = {},
		keys = {
			{ "<Leader>gg", "<Cmd>Neogit<CR>" }, -- Open git client
		},
	},
	-- Git commands in file
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<Leader>gb", "<Cmd>Gitsigns blame<CR>" }, -- Blame
			{ "[c", "<Cmd>Gitsigns nav_hunk prev<CR>" }, -- Goto previous hunk
			{ "]c", "<Cmd>Gitsigns nav_hunk next<CR>" }, -- Goto next hunk
			{ "[C", "<Cmd>Gitsigns nav_hunk first<CR>" }, -- Goto first hunk
			{ "]C", "<Cmd>Gitsigns nav_hunk last<CR>" }, -- Goto last hunk
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			gitbrowse = { enabled = true },
		},
		keys = {
			-- Open git forge for current file in browser
			{
				"<Leader>gB",
				function()
					Snacks.gitbrowser()
				end,
			},
		},
	},
	{ "akinsho/git-conflict.nvim", opts = {} },
	{ "sindrets/diffview.nvim", opts = {} }, -- Cycle diffs

	-- PKM tool
	{ "nvim-neorg/neorg", opts = {} }, -- TODO: Enable defaults and concealer addons

	-- Filesystem manager
	-- Filesystem explorer in sidebar
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				enabled = true,
				sources = {
					files = {
						hidden = true, -- Show hidden files
					},
				},
			},
		},
		keys = {
			-- Toggle explorer for current file
			{
				"<Leader>e",
				function()
					Snacks.explorer()
				end,
			},
		},
	},
	{ "stevearc/oil.nvim", opts = {} }, -- Filesystem explorer in buffer
	{ "chrisgrieser/nvim-genghis", opts = {} }, -- Commands for managing files and directories

	-- Terminal manager
	{
		"folke/snacks.nvim",
		opts = {
			terminal = { enabled = true },
		},
		keys = {
			-- Toggle terminal
			{
				"<Leader>t",
				function()
					Snacks.terminal()
				end,
			},
		},
	},

	-- REPL manager
	{ "Vigemus/iron.nvim", opts = {} },

	-- Snippet executer
	{
		"michaelb/sniprun",
		build = "cargo build --release",
		opts = {},
	},

	-- Folding
	"kevinhwang91/nvim-ufo", -- TODO: Enable this

	-- Outliner
	{
		"stevearc/aerial.nvim",
		opts = {},
		keys = {
			{ "gO", "<Cmd>AerialToggle<CR>" }, -- Toggle outline
		},
	},

	-- Treesitter integration
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main", -- TODO: Remove this when main is set as default branch
		build = ":TSUpdate",
		config = function()
			-- require("nvim-treesitter").install("all") -- Install all parsers asynchronously -- TODO: Keep this consistent with Emacs
			vim.treesitter.language.register("bash", "zsh") -- TODO: Remove this when zsh parser is supported officially
		end,
	},
	-- Text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- TODO: Remove this when main is set as default branch
		opts = {
			select = {
				lookahead = true, -- Automatically jump forward to text object
			},
		},
		-- TODO: Define other keymaps
		keys = {
			-- Select outside function
			{
				"af",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Select inside function
			{
				"if",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Select outside class
			{
				"ac",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Select inside class
			{
				"ic",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Select outside parameter
			{
				"aa",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Select inside parameter
			{
				"ia",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
				end,
				mode = { "x", "o" },
			},
			-- Goto start of next function
			{
				"]m",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto start of next class
			{
				"]]",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto start of next parameter
			{
				"]a",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of next function
			{
				"]M",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of next class
			{
				"][",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of next parameter
			{
				"]A",
				function()
					require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto start of previous function
			{
				"[m",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto start of previous class
			{
				"[[",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto start of previous parameter
			{
				"[a",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of previous function
			{
				"[M",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of previous class
			{
				"[]",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
			-- Goto end of previous parameter
			{
				"[A",
				function()
					require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects")
				end,
				mode = { "n", "x", "o" },
			},
		},
	},

	-- LSP integration
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Triggers for code lenses
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("lsp-code-lens", {}),
				callback = function()
					vim.lsp.codelens.refresh()
				end,
			})
			vim.lsp.inlay_hint.enable() -- Inlay hints
		end,
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			-- Triggers for linters
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("lint", {}),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		opts = {
			format_after_save = {}, -- Enable asynchronous formatting
		},
		config = function(_, opts)
			require("conform").setup(opts)
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	-- Test runner
	{ "nvim-neotest/neotest", opts = {} },

	-- Debugger
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", opts = {} },
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	-- Register debuggers
	{ "leoluz/nvim-dap-go", opts = {} }, -- Go

	-- AI integration
	-- TODO: Update model used
	-- TODO: Enable NES
	-- Model
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {},
	},
	{ "olimorris/codecompanion.nvim", opts = {} }, -- Chat interface

	-- GitHub client
	{ "pwntester/octo.nvim", opts = {} },

	-- Lua support
	"folke/lazydev.nvim", -- TODO: Disable server triggered

	-- Haskell support
	"mrcjkb/haskell-tools.nvim", -- TODO: Disable server triggered

	-- Rust support
	"mrcjkb/rustaceanvim", -- TODO: Disable server triggered
	{ "Saecki/crates.nvim", opts = {} },

	-- Go support
	"ray-x/go.nvim", -- TODO: Disable server triggered
})

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

	-- Scala
	scala = {
		language_server = "metals",
		-- TODO: Add linters
		formatters = { "scalafmt" },
	},

	-- TODO: Setup Clojure

	-- TODO: Setup Kotlin

	-- JavaScript
	javascript = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "biome" },
	},

	-- PureScript
	purescript = {
		language_server = "purescriptls",
		-- TODO: Add linters
		formatters = { "purs-tidy" },
	},

	-- TODO: Setup TypeScript

	-- C++
	cpp = {
		language_server = "clangd",
		linters = { "cppcheck" },
		formatters = { "clang-format" },
	},

	-- Python
	python = {
		language_server = "ruff", -- TODO: Replace with ty
		linters = { "ruff" },
		formatters = { "ruff_format" },
	},

	-- Protobuf
	proto = {
		language_server = "buf_ls",
		linters = { "buf_lint" },
		formatters = { "buf" },
	},

	-- TODO: Setup GraphQL

	-- JSON
	-- TODO: Setup JSON5
	json = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "gojq" }, -- TODO: Check alternatives
	},

	-- TOML
	toml = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "taplo" }, -- TODO: Check alternatives
	},

	-- TODO: Setup YAML
	yaml = {
		-- TODO: Add language server
		-- TODO: Add linters
		formatters = { "yq" }, -- TODO: Check alternatives
	},

	-- TODO: Setup CSV
}

-- Setup language tools
require("lint").linters_by_ft = {}
local function setup_language(filetype, config)
	-- Enabled treesitter syntax highlighting
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter-highlight", {}),
		pattern = filetype,
		callback = function()
			vim.treesitter.start()
		end,
	})
	-- Register language server
	if config.language_server then
		vim.lsp.enable(config.language_server)
	end
	-- Register linter
	if config.linters then
		require("lint").linters_by_ft[filetype] = config.linters
	end
	-- Register formatter
	if config.formatters then
		require("conform").formatters_by_ft[filetype] = config.formatters
	end
end

-- Setup tools for all configured languages
for filetype, config in pairs(languages) do
	setup_language(filetype, config)
end

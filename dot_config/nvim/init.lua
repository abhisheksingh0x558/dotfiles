-- Plugin manager
vim.opt.runtimepath:prepend(vim.fs.normalize("~/.local/share/nvim/lazy/lazy.nvim")) -- Load plugin manager

-- Code style
vim.g.editorconfig = true -- EditorConfig integration

-- Keymaps
vim.g.mapleader = " " -- Leader key
vim.g.maplocalleader = "\\" -- Local leader key

-- UI/UX
vim.opt.shortmess:append("I") -- Disable intro message
vim.o.number = true -- Enable line numbering
vim.o.cursorline = true -- Enable line highlighting
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.ignorecase = true -- Ignore case while searching
vim.o.smartcase = true -- Respect case if pattern has upper case characters
vim.o.splitright = true -- Put new window towards right on vertical split
vim.o.splitbelow = true -- Put new window towards bottom on horizontal split

-- Spell checker
vim.o.spell = true

require("lazy").setup({
	-- Collection of plugins
	{
		"folke/snacks.nvim",
		opts = {},
	},
	"echasnovski/mini.nvim",

	-- Lua transpiler
	{
		"rktjmp/hotpot.nvim",
		opts = {},
	},

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
	"nvim-neorg/neorg", -- TODO: Enable defaults and concealer addons

	-- Filesystem manager
	-- Filesystem explorer in sidebar
	{
		"folke/snacks.nvim",
		opts = {
			explorer = { enabled = true },
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
		branch = "main", -- TODO: Remove this when main is set as default branch
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install("all") -- Install all parsers asynchronously
			vim.treesitter.language.register("bash", "zsh") -- TODO: Remove this when zsh parser is supported officially
		end,
	},
	-- Text objects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main", -- TODO: Remove this when main is set as default branch
		-- TODO: Define other keymaps
		opts = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to text object
				keymaps = {
					["af"] = "@function.outer", -- Select outside function
					["if"] = "@function.inner", -- Select inside function
					["ac"] = "@class.outer", -- Select outside class
					["ic"] = "@class.inner", -- Select inside class
					["aa"] = "@parameter.outer", -- Select outside parameter
					["ia"] = "@parameter.inner", -- Select inside parameter
				},
			},
			move = {
				enable = true,
				goto_next_start = {
					["]m"] = "@function.outer", -- Goto start of next function
					["]]"] = "@class.outer", -- Goto start of next class
					["]a"] = "@parameter.inner", -- Goto start of next parameter
				},
				goto_next_end = {
					["]M"] = "@function.outer", -- Goto end of next function
					["]["] = "@class.outer", -- Goto end of next class
					["]A"] = "@parameter.inner", -- Goto end of next parameter
				},
				goto_previous_start = {
					["[m"] = "@function.outer", -- Goto start of previous function
					["[["] = "@class.outer", -- Goto start of previous class
					["[a"] = "@parameter.inner", -- Goto start of previous parameter
				},
				goto_previous_end = {
					["[M"] = "@function.outer", -- Goto end of previous function
					["[]"] = "@class.outer", -- Goto end of previous class
					["[A"] = "@parameter.inner", -- Goto end of previous parameter
				},
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

	-- AI integration
	-- TODO: Update model used
	{
		"olimorris/codecompanion.nvim",
		opts = {
			strategies = {
				chat = {
					adapter = "gemini",
				},
				inline = {
					adapter = "gemini",
				},
				cmd = {
					adapter = "gemini",
				},
			},
		},
	},

	-- GitHub client
	{ "pwntester/octo.nvim", opts = {} },
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

-- Plugin specifications
return {
	-- Collection of plugins
	{
		"folke/snacks.nvim",
		opts = {
			-- Key mappings
			-- Manipulate indentations
			scope = {
				enabled = true,
				keys = {
					jump = {},
				},
			},
		},
	},
	"echasnovski/mini.nvim",

	-- Lua libraries
	"kevinhwang91/promise-async", -- TODO: Use luarocks to manage this and remove from here
	"nvim-neotest/nvim-nio", -- TODO: Use luarocks to manage this and remove from here

	-- Lua transpiler
	{ "rktjmp/hotpot.nvim", opts = {} },

	-- Key mappings
	{ "numToStr/Comment.nvim", opts = {} }, -- Manipulate comments
	{ "kylechui/nvim-surround", opts = {} }, -- Manipulate surrounding pairs
	{ "gbprod/substitute.nvim", opts = {} }, -- Exchange text
	{ "johmsalas/text-case.nvim", opts = {} }, -- Manipulate text cases
	{ "folke/flash.nvim", opts = {} }, -- Navigate with search labels
	"Vonr/align.nvim", -- Manipulate alignments
	{ "MagicDuck/grug-far.nvim", opts = {} }, -- Find and replace in project
}

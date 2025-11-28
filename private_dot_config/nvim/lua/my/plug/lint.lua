local lint = require("lint")

-- Triggers for linters
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("my-lint", {}),
	callback = function()
		lint.try_lint()
	end,
})

return {}

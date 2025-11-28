vim.lsp.inlay_hint.enable() -- Inlay hints

-- Triggers for code lenses
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("my-lsp-code-lens", {}),
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

return {}

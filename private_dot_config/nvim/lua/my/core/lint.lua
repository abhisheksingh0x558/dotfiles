-- Define diagnostic jump key mapping
local function define_jump(key, severity, count, wrap)
	vim.keymap.set("n", key, function()
		vim.diagnostic.jump({ severity = severity, count = count, wrap = wrap or true })
	end)
end

-- Diagnostic jump key mappings
local keymaps = {
	{ "]e", vim.diagnostic.severity.ERROR, vim.v.count1 }, -- Go to next error
	{ "]w", vim.diagnostic.severity.WARN, vim.v.count1 }, -- Go to next warning
	{ "]i", vim.diagnostic.severity.INFO, vim.v.count1 }, -- Go to next info
	{ "]h", vim.diagnostic.severity.HINT, vim.v.count1 }, -- Go to next hint
	{ "[e", vim.diagnostic.severity.ERROR, -vim.v.count1 }, -- Go to previous error
	{ "[w", vim.diagnostic.severity.WARN, -vim.v.count1 }, -- Go to previous warning
	{ "[i", vim.diagnostic.severity.INFO, -vim.v.count1 }, -- Go to previous info
	{ "[h", vim.diagnostic.severity.HINT, -vim.v.count1 }, -- Go to previous hint
	{ "]E", vim.diagnostic.severity.ERROR, math.huge, false }, -- Go to last error
	{ "]W", vim.diagnostic.severity.WARN, math.huge, false }, -- Go to last warning
	{ "]I", vim.diagnostic.severity.INFO, math.huge, false }, -- Go to last info
	{ "]H", vim.diagnostic.severity.HINT, math.huge, false }, -- Go to last hint
	{ "[E", vim.diagnostic.severity.ERROR, -math.huge, false }, -- Go to first error
	{ "[W", vim.diagnostic.severity.WARN, -math.huge, false }, -- Go to first warning
	{ "[I", vim.diagnostic.severity.INFO, -math.huge, false }, -- Go to first info
	{ "[H", vim.diagnostic.severity.HINT, -math.huge, false }, -- Go to first hint
}

-- Define diagnostic jump key mappings
for _, keymap in ipairs(keymaps) do
	define_jump(unpack(keymap))
end

return {}

local luasnip = require("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.forward = function()
	if luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif check_back_space() then
		return t("<C-e>")
	end
	return ""
end

_G.backward = function()
	if luasnip and luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<C-n>")
	end
	return ""
end

vim.api.nvim_set_keymap("i", "<C-e>", "v:lua.forward()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-e>", "v:lua.forward()", { expr = true })
vim.api.nvim_set_keymap("i", "<C-n>", "v:lua.backward()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-n>", "v:lua.backward()", { expr = true })

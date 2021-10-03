local map = require("utils").map
local luasnip = require("luasnip")

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end

	local line, col = unpack(vim.api.nvim_win_get_cursor(0))

	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local t = function(key)
	return vim.api.nvim_replace_termcodes(key, true, true, true)
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif has_words_before() then
		return t("<Plug>cmp-complete")
	else
		return t("<Tab>")
	end
end

_G.shift_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<S-Tab>")
	end
end

map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("i", "<C-E>", "<Plug>luasnip-next-choice", {})
map("s", "<C-E>", "<Plug>luasnip-next-choice", {})

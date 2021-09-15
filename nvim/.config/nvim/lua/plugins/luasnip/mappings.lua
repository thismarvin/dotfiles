local map = require("utils").map

local function prequire(...)
	local status, lib = pcall(require, ...)
	if (status) then return lib end
		return nil
end

local luasnip = prequire("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	else
		return t("<Tab>")
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif luasnip and luasnip.jumpable(-1) then
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

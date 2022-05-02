local luasnip = require("luasnip")

local function forward()
	if luasnip and luasnip.expand_or_jumpable() then
		return "<Plug>luasnip-expand-or-jump"
	end

	return ""
end

local function backward()
	if luasnip and luasnip.jumpable(-1) then
		return "<Plug>luasnip-jump-prev"
	end

	return ""
end

vim.keymap.set({ "i", "s" }, "<C-n>", forward, { expr = true })
vim.keymap.set({ "i", "s" }, "<C-p>", backward, { expr = true })

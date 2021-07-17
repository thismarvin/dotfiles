local map = require("utils").map

local function t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
	return vim.fn.pumvisible() == 1 and t"<C-n>" or t"<Tab>"
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
map("i", "<Tab>", "v:lua.smart_tab()", { noremap = true, silent = true, expr = true })

local map = require("utils").map
local options = { noremap = true, silent = true }

map("n", "]d", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>zz", options)
map("n", "[d", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>zz", options)
map("n", "<leader>d", "<CMD>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", options)
map("n", "J", "<CMD>lua vim.lsp.buf.hover()<CR>", options)
map("n", "K", "<CMD>lua vim.lsp.buf.signature_help()<CR>", options)
map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", options)
map("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", options)
map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", options)
map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", options)
map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", options)
-- map("n", "<leader>sr", "<CMD>lua vim.lsp.buf.references()<CR>", options)
-- map("n", "<leader>ss", "<CMD>lua vim.lsp.buf.document_symbol()<CR>", options)

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t"<C-n>" or t"<Tab>"
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
map("i", "<Tab>", "v:lua.smart_tab()", { noremap = true, silent = true, expr = true })

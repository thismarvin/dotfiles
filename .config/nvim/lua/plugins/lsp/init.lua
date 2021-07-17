local M = {}

function M.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.cmd [[ command! Format execute "lua vim.lsp.buf.formatting()" ]]

	local map = vim.api.nvim_buf_set_keymap;
  local options = { noremap = true, silent = true }

	map(bufnr, "n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz", options)
	map(bufnr, "n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz", options)
	map(bufnr, "n", "<leader>d", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", options)
	map(bufnr, "n", "J", "<Cmd>lua vim.lsp.buf.hover()<CR>", options)
	map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", options)
	map(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", options)
	map(bufnr, "n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", options)
	map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", options)
	map(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", options)
	map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", options)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M

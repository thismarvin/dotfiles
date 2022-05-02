local M = {}

function M.on_attach(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.cmd([[ command! Format execute "lua vim.lsp.buf.formatting()" ]])

	local map = vim.api.nvim_buf_set_keymap
	local options = { noremap = true, silent = true }

	map(bufnr, "n", "]d", "<Cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>zz", options)
	map(bufnr, "n", "[d", "<Cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>zz", options)
	map(bufnr, "n", "<Leader>d", "<Cmd>lua vim.diagnostic.open_float(nil, { border = 'rounded' })<CR>", options)
	map(bufnr, "n", "<Leader>k", "<Cmd>lua vim.lsp.buf.hover()<CR>", options)
	map(bufnr, "n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", options)
	map(bufnr, "n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", options)
	map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>zz", options)
	map(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>zz", options)
	map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>zz", options)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

M.handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = false }
	),
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return M

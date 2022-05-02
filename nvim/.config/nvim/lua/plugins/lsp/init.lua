local M = {}

function M.on_attach(_, bufnr)
	local options = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "]d", "<Cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>zz", options)
	vim.keymap.set("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>zz", options)
	vim.keymap.set("n", "<Leader>d", "<Cmd>lua vim.diagnostic.open_float(nil, { border = 'rounded' })<CR>", options)
	vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, options)
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, options)
	vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, options)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

M.handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = false }
	),
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return M

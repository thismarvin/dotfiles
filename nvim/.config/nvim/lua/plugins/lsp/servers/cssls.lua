require("lspconfig").cssls.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
	cmd = { "css-languageserver", "--stdio" },
})

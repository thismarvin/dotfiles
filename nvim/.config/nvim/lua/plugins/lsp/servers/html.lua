require("lspconfig").html.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
	cmd = { "html-languageserver", "--stdio" },
})

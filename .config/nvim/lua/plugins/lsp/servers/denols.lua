require("lspconfig").denols.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
})

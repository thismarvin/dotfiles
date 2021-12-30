require("lspconfig").jsonls.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
	init_options = {
		provideFormatter = false,
	},
})

local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"

require("lspconfig").omnisharp.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
})

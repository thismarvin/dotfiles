local util = require("lspconfig").util

require("lspconfig").ccls.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
	root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", ".ccls"),
	init_options = {
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
})

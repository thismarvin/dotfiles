local execute = require("utils").execute

require("lspconfig").rust_analyzer.setup({
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
	handlers = require("plugins.lsp").handlers,
})

execute([[
augroup lsp
  autocmd!
  " Format Rust code on save.
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup end
]])

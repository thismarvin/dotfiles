local execute = require("utils").execute

require("lspconfig").rust_analyzer.setup {
	on_attach = require("plugins.lsp").on_attach,
	capabilities = require("plugins.lsp").capabilities,
}

execute([[
augroup lsp
  autocmd!
  " Format Rust code on save.
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

  " Enable type inlay hints
	autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require("lsp_extensions").inlay_hints{ prefix = "» ", highlight = "InlayHints", enabled = {"TypeHint", "ChainingHint" } }
augroup end
]])

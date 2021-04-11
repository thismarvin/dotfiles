local execute = require("utils").execute

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}

execute([[
augroup lsp
  autocmd!
  " Format Rust code on save.
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

  " Enable type inlay hints
  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require("lsp_extensions").inlay_hints{ prefix = " ", highlight = "Whitespace", enabled = { "TypeHint" } }
augroup end
]])

local set = require("utils").set
local execute = require("utils").execute

set("nobackup")
set("nowritebackup")
set("updatetime=300")
set("shortmess+=c")
set("signcolumn=yes")
set("completeopt=menu,menuone,noselect")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
}

vim.fn.sign_define("LspDiagnosticsSignError", { text = ">>" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "--" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "--" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "--" })

execute([[
augroup lsp
  autocmd!
  " Format Rust code on save.
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

  " Enable type inlay hints
  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = " ", highlight = "Whitespace", enabled = { "TypeHint" } }
augroup end
]])

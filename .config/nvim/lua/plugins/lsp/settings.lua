local set = require("utils").set

set("nobackup")
set("nowritebackup")
set("updatetime=250")
set("shortmess+=c")
set("signcolumn=yes")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

vim.fn.sign_define("LspDiagnosticsSignError", { text = ">>" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "--" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "--" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "--" })

local command = vim.api.nvim_command

local function set(expression)
    command(string.format("set " .. expression))
end

local function execute(expression)
  vim.api.nvim_exec(expression, true)
end

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

require("compe").setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = "enable";
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = false;
  };
}

execute([[
augroup lsp
  autocmd!
  " Format Rust code on save.
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

  " Enable type inlay hints
  autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = " ", highlight = "Whitespace", enabled = { "TypeHint" } }
augroup end
]])

local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = { "css", "html", "javascript", "json", "lua", "python", "rust", "toml" },
  highlight = {
    enable = true
  },
}

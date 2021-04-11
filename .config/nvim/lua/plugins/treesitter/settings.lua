local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = { "c", "cpp", "css", "html", "javascript", "json", "lua", "python", "rust", "toml" },
  highlight = {
    enable = true
  },
}

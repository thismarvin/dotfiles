local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = { "c", "comment", "cpp", "css", "html", "javascript", "json", "lua", "python", "regex", "rust", "toml", "typescript" },
  highlight = {
    enable = true,
  },
	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

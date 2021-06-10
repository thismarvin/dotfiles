local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = { "c", "comment", "cpp", "css", "html", "javascript", "json", "lua", "python", "regex", "rust", "toml", "typescript" },
  highlight = {
    enable = true,
  },
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
	},
	textsubjects = {
		enable = true,
		keymaps = {
			['.'] = 'textsubjects-smart',
		}
	},
}

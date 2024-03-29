local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = "all",
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
			["."] = "textsubjects-smart",
		},
	},
	context_commentstring = {
		enable = true,
	},
})

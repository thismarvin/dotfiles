vim.g.nvim_tree_git_hl = 1

require("nvim-tree").setup({
	hijack_netrw = false,
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
})

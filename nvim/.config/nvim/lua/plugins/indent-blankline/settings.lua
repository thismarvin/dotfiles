require("indent_blankline").setup {
	char = "┊", -- "│"
	show_trailing_blankline_indent = false,
	buftype_exclude = { "nofile", "terminal" },
	filetype_exclude = { "gesture", "help", "packer" }
}

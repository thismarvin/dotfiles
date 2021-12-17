require("telescope").setup({
	defaults = {
		dynamic_preview_title = true,
		path_display = { "smart" },
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				width = 0.8,
				height = 0.9,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")

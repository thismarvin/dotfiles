require("rust-tools").setup({
	tools = {
		autoSetHints = false,
		inlay_hints = {
			show_parameter_hints = false,
			other_hints_prefix = "=> ",
			highlight = "InlayHints",
		},
	},
})

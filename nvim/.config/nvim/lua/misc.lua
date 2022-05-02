require("plugins.thismarvin.surround")

vim.keymap.set("n", "mss", "<Cmd>lua require('plugins.thismarvin.surround').surround_line()<CR>", { silent = true })
vim.keymap.set("n", "ms", "<Cmd>set operatorfunc=SurroundOperatorCustom<CR>g@", { silent = true })

local misc_augroup = vim.api.nvim_create_augroup("misc", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal spell | setlocal cc=73 | colorscheme default",
	group = misc_augroup,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal spell",
	group = misc_augroup,
})

vim.o.number = true
vim.o.relativenumber = true
vim.o.confirm = true
vim.o.showmode = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.spelllang = "en_us"
vim.o.list = true
vim.o.listchars = "tab:╎ ,trail:·,eol:"
vim.o.cc = "101"
vim.o.mouse = "a"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 2
vim.o.laststatus = 3

local config_augroup = vim.api.nvim_create_augroup("config", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	command = "set cursorline",
	group = config_augroup,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	command = "set nocursorline",
	group = config_augroup,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
	group = config_augroup,
})

vim.api.nvim_create_user_command("W", "write", {})

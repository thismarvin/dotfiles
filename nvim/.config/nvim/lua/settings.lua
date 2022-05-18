vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.confirm = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.spelllang = "en_us"
vim.opt.list = true
vim.opt.listchars = "tab:╎ ,trail:·,eol:"
vim.opt.cc = "101"
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 2
vim.opt.laststatus = 3

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

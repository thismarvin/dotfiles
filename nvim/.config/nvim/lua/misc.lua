local execute = require("utils").execute

require("plugins.thismarvin.surround")

vim.keymap.set("n", "gss", "<Cmd>lua require('plugins.thismarvin.surround').surround_line()<CR>", { silent = true })
vim.keymap.set("n", "gs", "<Cmd>set operatorfunc=SurroundOperatorCustom<CR>g@", { silent = true })

execute([[
augroup misc
  autocmd!
	autocmd FileType gitcommit setlocal spell | setlocal cc=74
	autocmd FileType markdown setlocal spell | setlocal wrap
	autocmd FileType rust setlocal cc=100
augroup end
]])

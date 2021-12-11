local execute = require("utils").execute
local map = require("utils").map

require("plugins.thismarvin.surround")

map(
	"n",
	"gss",
	"<Cmd>lua require('plugins.thismarvin.surround').surround_line()<CR>",
	{ noremap = true, silent = true }
)
map("n", "gs", "<Cmd>set operatorfunc=SurroundOperatorCustom<CR>g@", { noremap = true, silent = true })

map(
	"n",
	"<Leader>md",
	"<Cmd>sp | e ~/scratchpad.md | setlocal spell | setlocal wrap<CR>",
	{ noremap = true, silent = true }
)

execute([[
augroup misc
  autocmd!
	autocmd FileType gitcommit setlocal spell | setlocal cc=74
	autocmd FileType markdown setlocal spell | setlocal wrap
	autocmd FileType rust setlocal cc=100
augroup end
]])

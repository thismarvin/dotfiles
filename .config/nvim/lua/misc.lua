local map = require("utils").map

require "plugins.thismarvin.surround"

map("n", "gss", "<Cmd>lua require('plugins.thismarvin.surround').surround_line()<CR>", { noremap = true, silent = true })
map("n", "gs", "<Cmd>set operatorfunc=SurroundOperatorCustom<CR>g@", { noremap = true, silent = true })

map("n", "<leader>md", "<Cmd>sp | e ~/sratchpad.md | setlocal spell | setlocal wrap<CR>", { noremap = true, silent = true })

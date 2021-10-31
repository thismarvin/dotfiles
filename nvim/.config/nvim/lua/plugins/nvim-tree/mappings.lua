local map = require("utils").map

map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<Leader>E", "<Cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true })

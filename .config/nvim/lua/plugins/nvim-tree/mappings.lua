local map = require("utils").map

map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>E", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })

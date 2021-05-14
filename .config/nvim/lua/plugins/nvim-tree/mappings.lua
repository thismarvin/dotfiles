local map = require("utils").map

map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>E", "<CMD>NvimTreeRefresh<CR>", { noremap = true, silent = true })

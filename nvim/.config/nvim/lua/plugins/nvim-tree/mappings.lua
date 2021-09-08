local map = require("utils").map

map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>E", "<Cmd>NvimTreeRefresh<CR>", { noremap = true, silent = true })

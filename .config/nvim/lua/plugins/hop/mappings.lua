local map = require("utils").map

map("n", "<leader><Up>", ":HopLine<CR>", { noremap = true, silent = true })
map("n", "<leader><Down>", ":HopLine<CR>", { noremap = true, silent = true })
map("n", "<leader>s", ":HopChar1<CR>", { noremap = true, silent = true })
map("v", "<leader><Up>", "<cmd>HopLine<CR>", { noremap = true, silent = true })
map("v", "<leader><Down>", "<cmd>HopLine<CR>", { noremap = true, silent = true })

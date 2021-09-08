local map = require("utils").map

map("n", "<C-t>", "<Cmd>lua require('FTerm').toggle()<CR>", { noremap = true })
map("t", "<C-t>", "<C-\\><C-n><Cmd>lua require('FTerm').toggle()<CR>", { noremap = true })

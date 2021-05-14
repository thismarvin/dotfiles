local map = require("utils").map

map("n", "<C-t>", "<CMD>lua require('FTerm').toggle()<CR>", { noremap = true })
map("t", "<C-t>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", { noremap = true })

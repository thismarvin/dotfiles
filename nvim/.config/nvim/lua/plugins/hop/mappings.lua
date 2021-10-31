local map = require("utils").map

map("n", "<Leader><Up>", ":HopLine<CR>", { noremap = true, silent = true })
map("n", "<Leader><Down>", ":HopLine<CR>", { noremap = true, silent = true })
map("n", "<Leader>/", ":HopPattern<CR>", { noremap = true, silent = true })
map("v", "<Leader><Up>", "<Cmd>HopLine<CR>", { noremap = true, silent = true })
map("v", "<Leader><Down>", "<Cmd>HopLine<CR>", { noremap = true, silent = true })

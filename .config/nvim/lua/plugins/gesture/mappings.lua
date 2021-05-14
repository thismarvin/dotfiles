local map = require("utils").map

map("n", "<RightMouse>", "<Nop>", { noremap = true, silent = true })
map("n", "<RightDrag>", "<CMD>lua require('gesture').draw()<CR>", { noremap = true, silent = true })
map("n", "<RightRelease>", "<CMD>lua require('gesture').finish()<CR>", { noremap = true, silent = true })

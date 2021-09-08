local map = require("utils").map

map("n", "<RightMouse>", "<Nop>", { noremap = true, silent = true })
map("n", "<RightDrag>", "<Cmd>lua require('gesture').draw()<CR>", { noremap = true, silent = true })
map("n", "<RightRelease>", "<Cmd>lua require('gesture').finish()<CR>", { noremap = true, silent = true })

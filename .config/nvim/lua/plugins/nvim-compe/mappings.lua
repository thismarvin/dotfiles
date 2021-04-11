local map = require("utils").map

map("i", "<CR>", [[compe#confirm("<CR>")]], { noremap = true, silent = true, expr = true })
map("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

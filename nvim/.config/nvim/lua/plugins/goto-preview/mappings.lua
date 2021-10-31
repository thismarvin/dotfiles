local map = require("utils").map

map("n", "<Leader>sp", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

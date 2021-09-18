local map = require("utils").map

map("n", "<Leader>sp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

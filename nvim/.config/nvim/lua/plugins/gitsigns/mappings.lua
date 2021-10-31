local map = require("utils").map

map("n", "]c", [[&diff ? "]c" : "<Cmd>lua require('gitsigns').next_hunk()<CR>"]], { noremap = true, expr = true })
map("n", "[c", [[&diff ? "[c" : "<Cmd>lua require('gitsigns').prev_hunk()<CR>"]], { noremap = true, expr = true })

map("n", "<Leader>b", "<Cmd>lua require('gitsigns').blame_line()<CR>", { noremap = true })

map("n", "<Leader>hs", "<Cmd>lua require('gitsigns').stage_hunk()<CR>", { noremap = true })
map("n", "<Leader>hu", "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { noremap = true })
map("n", "<Leader>hr", "<Cmd>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
map("n", "<Leader>hR", "<Cmd>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
map("n", "<Leader>hp", "<Cmd>lua require('gitsigns').preview_hunk()<CR>", { noremap = true })

-- -- Text objects
-- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
-- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'

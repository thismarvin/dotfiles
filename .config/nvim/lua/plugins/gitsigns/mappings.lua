local map = require("utils").map

map("n", "]c", [[&diff ? "]c" : "<Cmd>lua require('gitsigns').next_hunk()<CR>"]], { noremap = true, expr = true })
map("n", "[c", [[&diff ? "[c" : "<Cmd>lua require('gitsigns').prev_hunk()<CR>"]], { noremap = true, expr = true })

map("n", "<leader>b", "<Cmd>lua require('gitsigns').blame_line()<CR>", { noremap = true })

map("n", "<leader>hs", "<Cmd>lua require('gitsigns').stage_hunk()<CR>", { noremap = true })
map("n", "<leader>hu", "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { noremap = true })
map("n", "<leader>hr", "<Cmd>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
map("n", "<leader>hR", "<Cmd>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
map("n", "<leader>hp", "<Cmd>lua require('gitsigns').preview_hunk()<CR>", { noremap = true })

-- -- Text objects
-- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
-- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'

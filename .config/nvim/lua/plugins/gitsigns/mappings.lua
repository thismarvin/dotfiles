local map = require("utils").map

map("n", "]c", [[&diff ? "]c" : "<CMD>lua require('gitsigns').next_hunk()<CR>"]], { noremap = true, expr = true })
map("n", "[c", [[&diff ? "[c" : "<CMD>lua require('gitsigns').prev_hunk()<CR>"]], { noremap = true, expr = true })

map("n", "<leader>b", "<CMD>lua require('gitsigns').blame_line()<CR>", { noremap = true })

map("n", "<leader>hs", "<CMD>lua require('gitsigns').stage_hunk()<CR>", { noremap = true })
map("n", "<leader>hu", "<CMD>lua require('gitsigns').undo_stage_hunk()<CR>", { noremap = true })
map("n", "<leader>hr", "<CMD>lua require('gitsigns').reset_hunk()<CR>", { noremap = true })
map("n", "<leader>hR", "<CMD>lua require('gitsigns').reset_buffer()<CR>", { noremap = true })
map("n", "<leader>hp", "<CMD>lua require('gitsigns').preview_hunk()<CR>", { noremap = true })

-- -- Text objects
-- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
-- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'

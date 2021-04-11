local map = require("utils").map
local execute = require("utils").execute

-- -- Allows vim-rooter and startify to coexist.
-- execute([[
-- augroup startify_test
--   autocmd!
--   autocmd User StartifyBufferOpened :Rooter
-- augroup end
-- ]])

-- Mappings for my jank plugin!
map("n", "<C-t>", [[:lua require("nvim-term").toggle()<CR>]], { noremap=true, silent=true })
map("t", "<C-t>", [[<C-\><C-n>:lua require("nvim-term").toggle()<CR>]], { noremap=true, silent=true })

-- TODO: Deal with compe + autopairs <CR> mapping...

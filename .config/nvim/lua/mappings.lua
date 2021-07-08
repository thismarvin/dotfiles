local map = require("utils").map

vim.g.mapleader = " "
map("n", "<Leader>", "<Nop>", { noremap = true })

map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })
-- map("t", "<C-s>", "<C-\\><C-N>", { noremap = true })
-- map("n", "<C-a>", "ggVG", { noremap = true })
map("n", "U", "<C-r>", { noremap = true })
map("n", "<Leader>w", "<C-w>", { noremap = true })
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
-- map("n", "<Leader>n", ":noh<CR><C-L>", { noremap = true, silent = true })
map("n", "<Esc>", "<Cmd>noh<CR><Esc>", { noremap = true, silent = true })
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })
map("n", "Y", "y$", { noremap = true })
map("n", "<Leader>cd", "<Cmd>cd %:p:h<CR><Cmd>echo 'Set working directory to:' expand('%:p:h')<CR>", { noremap = true })
map("n", "<F12>", ":setlocal spell!<CR>", { noremap = true, silent = true })

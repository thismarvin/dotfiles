local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", ";", ":", { noremap = true })
map("n", "<C-s>", ":up<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc>:up<CR>", { noremap = true, silent = true })
map("v", "<C-s>", "<Esc>:up<CR>", { noremap = true, silent = true })
map("t", "<C-s>", "<C-\\><C-N>", { noremap = true })
map("n", "<C-a>", "ggVG", { noremap = true })
map("n", "U", "<C-r>", { noremap = true })
map("n", "<leader>w", "<C-w>", { noremap = true })
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })
map("n", "<leader>n", ":noh<CR><C-L>", { noremap = true, silent = true })
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })
map("n", "Y", "y$", { noremap = true })
map("n", "<F12>", ":setlocal spell!<CR>", { noremap = true, silent = true })

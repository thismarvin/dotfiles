local map = require("utils").map
local options = { noremap = true, silent = true }

map("n", "<leader>p", ":Files<CR>", options)
map("n", "<leader>P", ":GFiles<CR>", options)
map("n", "<leader>f", ":Rg<CR>", options)
map("n", "<leader>/", ":BLines<CR>", options)

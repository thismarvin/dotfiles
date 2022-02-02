vim.keymap.set({ "n", "x" }, "<Leader><Up>", "<Cmd>HopLine<CR>")
vim.keymap.set({ "n", "x" }, "<Leader><Down>", "<Cmd>HopLine<CR>")
vim.keymap.set({ "n", "x" }, "s", "<Cmd>HopPattern<CR>")
vim.keymap.set({ "n", "x" }, "S", "<Cmd>HopPattern<CR>")

-- vim.keymap.set(
-- 	"n",
-- 	"f",
-- 	"<Cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<CR>"
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"F",
-- 	"<Cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>"
-- )

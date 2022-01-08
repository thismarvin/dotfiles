local Job = require("plenary.job")

vim.keymap.set("n", "<Leader>p", "<Cmd>lua require('plugins.telescope.mappings').project_files()<CR>")
vim.keymap.set("n", "<Leader>P", "<Cmd>lua require('telescope.builtin').find_files()<CR>")
vim.keymap.set("n", "<Leader>f", "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
vim.keymap.set("n", "<Leader>F", "<Cmd>lua require('telescope.builtin').live_grep()<CR>")
vim.keymap.set("n", "<Leader>ss", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
vim.keymap.set("n", "<Leader>sr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")

local M = {}
local cache = {}

-- Use git_files if we are in a git repository; otherwise, use fd.
M.project_files = function()
	local working_directory = vim.fn.expand("%:p:h")

	-- I use fuzzy finding a lot; it makes sense to cache whether or not
	-- the current working directory is a valid git repository.
	if cache[working_directory] == nil then
		local _, code = Job
			:new({
				command = "git",
				args = { "rev-parse", "--show-toplevel" },
				cwd = working_directory,
			})
			:sync()

		-- Assuming the command above works, set the current entry of the
		-- cache to true if we are in a git repository.
		if code == 0 then
			cache[working_directory] = true
		else
			cache[working_directory] = false
		end
	end

	if cache[working_directory] then
		require("telescope.builtin").git_files()
	else
		require("telescope.builtin").fd()
	end
end

return M

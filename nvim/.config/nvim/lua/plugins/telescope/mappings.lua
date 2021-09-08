local map = require("utils").map
local Job = require("plenary.job")

map("n", "<leader>p", "<cmd>lua require('plugins.telescope.mappings').project_files()<cr>", { noremap = true })
map("n", "<leader>P", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map("n", "<leader>f", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", { noremap = true })
map("n", "<leader>F", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
map("n", "<leader>ss", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { noremap = true })
map("n", "<leader>sr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", { noremap = true })

local M = {}
local cache = {}

-- Use git_files if we are in a git repository; otherwise, use fd.
M.project_files = function()
	local working_directory = vim.fn.expand("%:p:h")

	-- I use fuzzy finding a lot; it makes sense to cache whether or not
	-- the current working directory is a valid git repository.
	if cache[working_directory] == nil then
		local _, code = Job:new({
			command = "git",
			args = { "rev-parse", "--show-toplevel" },
			cwd = working_directory
		}):sync()

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

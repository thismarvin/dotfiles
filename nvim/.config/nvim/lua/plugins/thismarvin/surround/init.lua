local execute = require("utils").execute

-- TODO: Visual Mode Support!

local M = {}

execute([[
function! SurroundOperatorCustom(type, ...)
	lua require"plugins.thismarvin.surround".surround_operator()
endfunction
]])

function M.parse_delimeter(delimeter)
	local opening = delimeter;
	local closing = delimeter;

	-- TODO: Have closing initially be opening in reverse and then swap some characters!

	string.match(delimeter, "\\w+")

	if delimeter == "\\" then
		opening = "\\\\"
		closing = "\\\\"
	elseif delimeter == "{" then
		closing = "}"
	elseif delimeter == "}" then
		opening = "{"
	elseif delimeter == "(" then
		closing = ")"
	elseif delimeter == ")" then
		opening = "("
	elseif delimeter == "[" then
		closing = "]"
	elseif delimeter == "]" then
		opening = "["
	elseif delimeter == "<" then
		closing = ">"
	elseif delimeter == ">" then
		opening = "<"
	elseif delimeter == "/*" then
		closing = "*/"
	elseif delimeter == "*/" then
		opening = "/*"
	end

	-- Handle a handful of characters that must be escaped.
	if delimeter == [["]] or delimeter == "<" then
		opening = string.format("\\%s", opening)
		closing = string.format("\\%s", closing)
	end

	return opening, closing
end

-- Yoinked from: https://github.com/blackCauldron7/surround.nvim/blob/43c85b5515c5ef597a0c527f68faa5b5908e9858/lua/surround/utils.lua#L110
function M.get_operator_pos()
  local start = vim.api.nvim_buf_get_mark(0, "[")
  local start_line = start[1]
  local start_col = start[2] + 1
  local _end = vim.api.nvim_buf_get_mark(0, "]")
  local end_line = _end[1]
  local end_col = _end[2] + 2

  return start_line, start_col, end_line, end_col
end

function M.surround_operator()
	-- Prompt the user to enter a character to surround the line with.
  vim.fn.inputsave()
  local ok, value = pcall(vim.fn.input, "Surround with: ")
  vim.fn.inputrestore()

	if not ok then
		vim.cmd([[echohl Error | echo "Could not read input."]])
		return
	elseif #value == 0 then
		vim.cmd([[echohl Error | echo "Invalid input."]])
		return
	end

	local opening, closing = M.parse_delimeter(value)

	local start_line, start_col, end_line, end_col = M.get_operator_pos()
	if start_line == end_line then
		local domain = end_col - start_col
		execute(string.format([[exe "normal i%s\<Esc>%sla%s\<Esc>"]], opening, domain, closing))
	else
		local range = end_line - start_line
		-- execute(string.format([[exe "normal I{\<Esc>%sjA}\<Esc>"]], range))
		-- execute(string.format([[exe "normal V%sjdO%s\<Enter>\<Backspace>%s\<Esc>kpV%sj>\<Esc>%sk^"]], range, opening, closing, range, range))
		execute(string.format([[exe "normal O%s\<Esc>%sjo%s\<Esc>kV%sk>\<Esc>"]], opening, range + 1, closing, range))
	end
end

function M.surround_line()
	-- Prompt the user to enter a character to surround the line with.
  vim.fn.inputsave()
  local ok, value = pcall(vim.fn.input, "Surround with: ")
  vim.fn.inputrestore()

	if not ok then
		vim.cmd([[echohl Error | echo "Could not read input."]])
		return
	elseif #value == 0 then
		vim.cmd([[echohl Error | echo "Invalid characters."]])
		return
	end

	local opening, closing = M.parse_delimeter(value)

	execute(string.format([[exe "normal ^i%s\<Esc>g_a%s\<Esc>^"]], opening, closing))
end

return M

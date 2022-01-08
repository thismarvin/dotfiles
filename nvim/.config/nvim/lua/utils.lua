local Utils = {}

local command = vim.api.nvim_command

function Utils.execute(expression)
	vim.api.nvim_exec(expression, true)
end

function Utils.has(key)
	return vim.fn.has(key) == 1
end

function Utils.set(expression)
	command(string.format("set " .. expression))
end

return Utils

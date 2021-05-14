local function execute(expression)
    vim.api.nvim_exec(expression, true)
end

local M = {}

local id = nil
local closed = false

function M.toggle()
  if id == nil then
   execute(":sp")
   id = vim.api.nvim_create_buf(false, false)
   vim.api.nvim_set_current_buf(id)
   execute(":term")
   execute(":set nonumber")
   execute(":resize 15")
   execute(":startinsert")
   execute(":setlocal bufhidden=hide")
  else
    if closed then
       execute(":sp")
       execute(":resize 15")
       execute(":startinsert")
       vim.api.nvim_set_current_buf(id)
       closed = false
    else
       vim.api.nvim_set_current_buf(id)
       execute("q")
       closed = true
    end
  end
end

return M

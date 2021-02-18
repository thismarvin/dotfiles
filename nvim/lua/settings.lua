local command = vim.api.nvim_command

local function execute(expression)
    vim.api.nvim_exec(expression, true)
end

local function set(expression)
    command(string.format("set " .. expression))
end

set("number")
set("nowrap")
set("noshowmode")
set("confirm")
set("autoread")
set("noswapfile")
set("undofile")
set("smartindent")
set("ignorecase")
set("smartcase")
set("splitbelow")
set("splitright")
set("list")
set("listchars=tab:\\ ,trail:·")
set("clipboard=unnamedplus")
set("mouse=a")
set("spelllang=en_us")
set("tabstop=2")
set("shiftwidth=2")

execute([[
augroup vimrc
  autocmd!
  " Only show the cursor line when in insert mode.
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline

  " After yanking a selection, highlight the selection for a bit.
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
augroup end
]])

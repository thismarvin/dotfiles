local execute = require("utils").execute
local set = require("utils").set

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
set("listchars=tab:┊\\ ,trail:·")
set("clipboard=unnamedplus")
set("mouse=a")
set("spelllang=en_us")
set("tabstop=2")
set("shiftwidth=2")
set("scrolloff=4")

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

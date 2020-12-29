syntax on

set number
set nowrap
set undofile
set autoread
set confirm
set smartindent
set ignorecase
set smartcase
set clipboard=unnamedplus
set mouse=a
set spelllang=en_us
set splitright
set splitbelow
set tabstop=2
set shiftwidth=2

set list
set listchars=tab:\ ,trail:·

if has("win32")
  set isfname-=:
endif

augroup my_commands
  autocmd!
  " Only show the cursor line when in insert mode.
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline
  " After yanking a selection, highlight the selection for a bit.
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 }
augroup end


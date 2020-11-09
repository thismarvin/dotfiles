syntax on

set number
set nowrap
set undofile
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

if has("win32")
	set isfname-=:
	" Unfortunately, the following line messes up a bunch of plugins. :(
	""set shell=powershell
endif

augroup my_commands
  autocmd!
	" Only show the cursor line when in insert mode.
	autocmd InsertEnter * set cursorline
	autocmd InsertLeave * set nocursorline
augroup end


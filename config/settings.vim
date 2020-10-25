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

set tabstop=2
set shiftwidth=2

if has("win32")
	set isfname-=:
	" Unfortunately, the following line messes up a bunch of plugins. :(
	""set shell=powershell
endif

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul


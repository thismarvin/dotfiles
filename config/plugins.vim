call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-dispatch'
Plug 'dense-analysis/ale'

Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'

Plug 'easymotion/vim-easymotion'

Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

call plug#end()


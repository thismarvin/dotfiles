call plug#begin(stdpath('data') . '/plugged')

" Essentials.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'

" QOL.
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'

" COC.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" C# Support.
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'tpope/vim-dispatch'
Plug 'dense-analysis/ale'

" Interface. 
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'

" Color Themes.
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Misc.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/tagbar'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'

call plug#end()


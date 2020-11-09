call plug#begin(stdpath('data') . '/plugged')

" Essentials.
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'editorconfig/editorconfig-vim'

" QOL.
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" COC.
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" C# Support.
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'tpope/vim-dispatch'
Plug 'dense-analysis/ale'

" Interface. 
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'wfxr/minimap.vim'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'

" Color Themes.
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'nanotech/jellybeans.vim'

call plug#end()

